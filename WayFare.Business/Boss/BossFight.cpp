#include <cmath>
#include "WayFare.Business/Boss/BossFight.hpp"
#include "WayFare.Business/Combat/Weapons.hpp"
#include "WayFare.Business/Enemies/EnemyAI.hpp"
#include "WayFare.Business/Enemies/EnemySpawner.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	const double bossMaxDeltaTime = 0.1;
	const double bossPlayerRadius = 0.25;
	const double bossStopDistance = 1.3;
	const double bossAttackDistance = 1.7;
	const double bossChargeDistance = 4.0;
	const double bossChargeHitPadding = 0.15;
	const double bossAimLock = 0.35;
	const double bossSwipeArcCos = 0.34;
	const double bossSwordArcCos = 0.6;
	const double bossIntroTurnSpeed = 2.5;
	const double bossHurtDuration = 0.2;
	const double bossTwoPi = 6.2831853;

	double getBossSpeed(int phase) {
		if (phase == 3) {
			return 1.6;
		}
		if (phase == 2) {
			return 1.3;
		}
		return 1.0;
	}

	double getBossCooldown(int phase) {
		if (phase == 3) {
			return 0.8;
		}
		if (phase == 2) {
			return 1.1;
		}
		return 1.5;
	}

	Boss createBoss(const Maze& maze, int arenaSize) {
		int size = int(maze.tiles.size());
		int first = size - 1 - arenaSize;
		int last = size - 2;
		double center = (first + last + 1) / 2.0;

		Boss boss = { center, center, std::atan2(-1.0, -1.0), bossMaxHealth, 1, BossState::Waiting, 0.0, 0.0, 0.0, 0.0, 0.0, false, 0, first, last };
		return boss;
	}

	int getBossPhase(int health) {
		if (health > bossMaxHealth * 2 / bossPhaseCount) {
			return 1;
		}
		if (health > bossMaxHealth / bossPhaseCount) {
			return 2;
		}
		return 3;
	}

	bool isPlayerInArena(const Boss& boss, const Player& player) {
		return player.x >= boss.arenaFirst + 1.0 && player.y >= boss.arenaFirst + 1.0;
	}

	bool isBossCutscenePlaying(const Boss& boss) {
		if (boss.state == BossState::Intro) {
			return true;
		}
		return boss.state == BossState::Dead && boss.stateTime < bossDeathDuration;
	}

	bool isArenaLocked(const Boss& boss) {
		return boss.state != BossState::Waiting && boss.state != BossState::Dead;
	}

	void keepPlayerInArena(const Boss& boss, Player& player) {
		if (!isArenaLocked(boss)) {
			return;
		}

		double low = boss.arenaFirst + bossPlayerRadius;
		if (player.x < low) {
			player.x = low;
		}
		if (player.y < low) {
			player.y = low;
		}
	}

	bool isBossFightWallAt(const Maze& maze, int x, int y) {
		int size = int(maze.tiles.size());

		if (x < 0 || y < 0 || x >= size || y >= size) {
			return true;
		}

		return maze.tiles[y][x] == Tile::Wall;
	}

	bool isBossFightPlayerBlocked(const Maze& maze, double x, double y) {
		int left = int(std::floor(x - bossPlayerRadius));
		int right = int(std::floor(x + bossPlayerRadius));
		int top = int(std::floor(y - bossPlayerRadius));
		int bottom = int(std::floor(y + bossPlayerRadius));

		for (int tileY = top; tileY <= bottom; tileY++) {
			for (int tileX = left; tileX <= right; tileX++) {
				if (isBossFightWallAt(maze, tileX, tileY)) {
					return true;
				}
			}
		}

		return false;
	}

	bool clampBossToArena(Boss& boss) {
		double low = boss.arenaFirst + bossRadius;
		double high = boss.arenaLast + 1.0 - bossRadius;
		bool clamped = false;

		if (boss.x < low) {
			boss.x = low;
			clamped = true;
		}
		if (boss.x > high) {
			boss.x = high;
			clamped = true;
		}
		if (boss.y < low) {
			boss.y = low;
			clamped = true;
		}
		if (boss.y > high) {
			boss.y = high;
			clamped = true;
		}

		return clamped;
	}

	void turnBossFightPlayer(Player& player, double target, double maxTurn) {
		double difference = std::remainder(target - player.facing, bossTwoPi);

		if (difference > maxTurn) {
			difference = maxTurn;
		}
		if (difference < -maxTurn) {
			difference = -maxTurn;
		}

		player.facing = std::fmod(player.facing + difference, bossTwoPi);
		if (player.facing < 0.0) {
			player.facing = player.facing + bossTwoPi;
		}
	}

	void pushPlayerFromBoss(const Boss& boss, Player& player, const Maze& maze) {
		double dx = player.x - boss.x;
		double dy = player.y - boss.y;
		double distance = std::sqrt(dx * dx + dy * dy);
		double minimum = bossRadius + bossPlayerRadius;

		if (distance >= minimum) {
			return;
		}

		if (distance < 0.0001) {
			dx = std::cos(boss.facing);
			dy = std::sin(boss.facing);
			distance = 1.0;
		}

		double push = minimum - distance;
		double stepX = dx / distance * push;
		double stepY = dy / distance * push;

		if (!isBossFightPlayerBlocked(maze, player.x + stepX, player.y)) {
			player.x = player.x + stepX;
		}

		if (!isBossFightPlayerBlocked(maze, player.x, player.y + stepY)) {
			player.y = player.y + stepY;
		}
	}

	void startBossState(Boss& boss, BossState state) {
		boss.state = state;
		boss.stateTime = 0.0;
		boss.attackLanded = false;
	}

	void finishBossAttack(Boss& boss, BossState next) {
		startBossState(boss, next);
		boss.cooldown = getBossCooldown(boss.phase);
		boss.attackCount = boss.attackCount + 1;
	}

	void hitPlayerWithBoss(Player& player, int amount, BossUpdateResponse& response) {
		DamageStatus status = damagePlayer(player, amount);

		if (status == DamageStatus::Success || status == DamageStatus::Died) {
			response.playerHit = true;
		}
	}

	void updateBossChase(Boss& boss, const Player& player, double distance, double deltaTime) {
		double dx = player.x - boss.x;
		double dy = player.y - boss.y;

		boss.facing = std::atan2(dy, dx);

		if (distance <= bossAttackDistance && boss.cooldown <= 0.0) {
			if (boss.phase >= 2 && boss.attackCount % 2 == 1) {
				startBossState(boss, BossState::Slamming);
				return;
			}
			startBossState(boss, BossState::Swiping);
			return;
		}

		if (boss.phase == 3 && distance >= bossChargeDistance && boss.cooldown <= 0.0 && isPlayerInArena(boss, player)) {
			startBossState(boss, BossState::Charging);
			return;
		}

		if (distance <= bossStopDistance) {
			return;
		}

		double step = getBossSpeed(boss.phase) * deltaTime;
		if (step > distance - bossStopDistance) {
			step = distance - bossStopDistance;
		}

		boss.x = boss.x + dx / distance * step;
		boss.y = boss.y + dy / distance * step;
		clampBossToArena(boss);
	}

	void updateBossCharge(Boss& boss, Player& player, double toPlayer, double deltaTime, BossUpdateResponse& response) {
		if (boss.stateTime < bossChargeWindup) {
			boss.facing = toPlayer;
			boss.chargeX = std::cos(toPlayer);
			boss.chargeY = std::sin(toPlayer);
			return;
		}

		double step = bossChargeSpeed * deltaTime;
		boss.x = boss.x + boss.chargeX * step;
		boss.y = boss.y + boss.chargeY * step;
		bool stopped = clampBossToArena(boss);

		double dx = player.x - boss.x;
		double dy = player.y - boss.y;
		bool hit = std::sqrt(dx * dx + dy * dy) <= bossRadius + bossPlayerRadius + bossChargeHitPadding;
		if (hit) {
			hitPlayerWithBoss(player, bossChargeDamage, response);
		}

		if (hit || stopped || boss.stateTime >= bossChargeWindup + bossChargeTime) {
			finishBossAttack(boss, BossState::Recovering);
		}
	}

	BossUpdateResponse updateBoss(Boss& boss, Player& player, const Maze& maze, double deltaTime) {
		BossUpdateResponse response = { true, "", false, false, false, false };
		bool cutscene = boss.state == BossState::Dead && boss.stateTime < bossDeathDuration;

		if (deltaTime > bossMaxDeltaTime) {
			deltaTime = bossMaxDeltaTime;
		}

		boss.stateTime = boss.stateTime + deltaTime;
		boss.hurtTime = boss.hurtTime - deltaTime;
		if (boss.hurtTime < 0.0) {
			boss.hurtTime = 0.0;
		}

		if (boss.state == BossState::Dead) {
			if (cutscene) {
				turnBossFightPlayer(player, std::atan2(boss.y - player.y, boss.x - player.x), bossIntroTurnSpeed * deltaTime);
				response.defeated = boss.stateTime >= bossDeathDuration;
			}
			pushPlayerFromBoss(boss, player, maze);
			return response;
		}

		if (isPlayerDead(player)) {
			response.success = false;
			response.errorMessage = "Player is dead";
			return response;
		}

		if (boss.state == BossState::Waiting) {
			if (isPlayerInArena(boss, player)) {
				startBossState(boss, BossState::Intro);
				response.started = true;
			}
			return response;
		}

		boss.cooldown = boss.cooldown - deltaTime;
		if (boss.cooldown < 0.0) {
			boss.cooldown = 0.0;
		}

		double dx = player.x - boss.x;
		double dy = player.y - boss.y;
		double distance = std::sqrt(dx * dx + dy * dy);
		double toPlayer = std::atan2(dy, dx);

		if (boss.state == BossState::Intro) {
			boss.facing = toPlayer;
			turnBossFightPlayer(player, std::atan2(-dy, -dx), bossIntroTurnSpeed * deltaTime);
			if (boss.stateTime >= bossIntroDuration) {
				startBossState(boss, BossState::Chasing);
			}
		}
		else if (boss.state == BossState::Roaring) {
			boss.facing = toPlayer;
			if (boss.stateTime >= bossRoarDuration) {
				startBossState(boss, BossState::Chasing);
			}
		}
		else if (boss.state == BossState::Swiping) {
			if (boss.stateTime < bossSwipeHitTime - bossAimLock) {
				boss.facing = toPlayer;
			}
			if (!boss.attackLanded && boss.stateTime >= bossSwipeHitTime) {
				boss.attackLanded = true;
				double facingDot = 1.0;
				if (distance > 0.0001) {
					facingDot = (dx * std::cos(boss.facing) + dy * std::sin(boss.facing)) / distance;
				}
				if (distance <= bossSwipeRange && facingDot >= bossSwipeArcCos) {
					hitPlayerWithBoss(player, bossSwipeDamage, response);
				}
			}
			if (boss.stateTime >= bossSwipeDuration) {
				finishBossAttack(boss, BossState::Chasing);
			}
		}
		else if (boss.state == BossState::Slamming) {
			if (boss.stateTime < bossSlamHitTime - bossAimLock) {
				boss.facing = toPlayer;
			}
			if (!boss.attackLanded && boss.stateTime >= bossSlamHitTime) {
				boss.attackLanded = true;
				response.slammed = true;
				if (distance <= bossSlamRadius) {
					hitPlayerWithBoss(player, bossSlamDamage, response);
				}
			}
			if (boss.stateTime >= bossSlamDuration) {
				finishBossAttack(boss, BossState::Chasing);
			}
		}
		else if (boss.state == BossState::Charging) {
			updateBossCharge(boss, player, toPlayer, deltaTime, response);
		}
		else if (boss.state == BossState::Recovering) {
			if (boss.stateTime >= bossRecoverDuration) {
				startBossState(boss, BossState::Chasing);
			}
		}
		else {
			updateBossChase(boss, player, distance, deltaTime);
		}

		pushPlayerFromBoss(boss, player, maze);
		keepPlayerInArena(boss, player);
		return response;
	}

	BossHitStatus damageBoss(Boss& boss, int amount) {
		if (amount <= 0 || boss.state == BossState::Dead) {
			return BossHitStatus::Failure;
		}

		if (boss.state == BossState::Waiting || boss.state == BossState::Intro || boss.state == BossState::Roaring) {
			return BossHitStatus::Invulnerable;
		}

		boss.health = boss.health - amount;
		boss.hurtTime = bossHurtDuration;

		if (boss.health <= 0) {
			boss.health = 0;
			startBossState(boss, BossState::Dead);
			return BossHitStatus::Killed;
		}

		int phase = getBossPhase(boss.health);
		if (phase > boss.phase) {
			boss.phase = phase;
			boss.cooldown = 0.0;
			startBossState(boss, BossState::Roaring);
			return BossHitStatus::PhaseChanged;
		}

		return BossHitStatus::Success;
	}

	BossHitStatus hitBossWithSword(Boss& boss, const Player& player) {
		double dx = boss.x - player.x;
		double dy = boss.y - player.y;
		double distance = std::sqrt(dx * dx + dy * dy);

		if (distance > swordRange + bossRadius) {
			return BossHitStatus::Miss;
		}

		if (distance > bossRadius && (dx * std::cos(player.facing) + dy * std::sin(player.facing)) / distance < bossSwordArcCos) {
			return BossHitStatus::Miss;
		}

		return damageBoss(boss, swordDamage);
	}

	BossHitStatus hitBossWithPistol(Boss& boss, const Player& player, double range) {
		double dx = boss.x - player.x;
		double dy = boss.y - player.y;
		double forwardX = std::cos(player.facing);
		double forwardY = std::sin(player.facing);
		double along = dx * forwardX + dy * forwardY;
		double side = std::fabs(dx * forwardY - dy * forwardX);

		if (along < 0.0 || along - bossRadius > range || side > bossRadius) {
			return BossHitStatus::Miss;
		}

		return damageBoss(boss, pistolDamage);
	}

	std::vector<Enemy> createBossMinions(const Boss& boss) {
		std::vector<Enemy> minions;

		for (int i = 0; i < bossMinionCount; i++) {
			Enemy minion = createEnemy(EnemyType::NightmareCreature, boss.x, boss.y);
			minion.state = EnemyState::Dormant;
			minions.push_back(minion);
		}

		return minions;
	}

	double clampBossMinionCoordinate(const Boss& boss, double value) {
		double low = boss.arenaFirst + 0.5;
		double high = boss.arenaLast + 0.5;

		if (value < low) {
			return low;
		}
		if (value > high) {
			return high;
		}
		return value;
	}

	int summonBossMinions(std::vector<Enemy>& enemies, const Boss& boss) {
		std::vector<double> sideAngles = { 0.9, -0.9, 2.0 };
		int count = 0;
		if (boss.phase == 2) {
			count = 2;
		}
		if (boss.phase == 3) {
			count = 3;
		}

		int summoned = 0;
		for (size_t i = 0; i < enemies.size() && summoned < count; i++) {
			if (enemies[i].state != EnemyState::Dormant) {
				continue;
			}

			double angle = boss.facing + sideAngles[summoned];
			enemies[i].x = clampBossMinionCoordinate(boss, boss.x + std::cos(angle) * bossMinionDistance);
			enemies[i].y = clampBossMinionCoordinate(boss, boss.y + std::sin(angle) * bossMinionDistance);
			enemies[i].facing = boss.facing;
			enemies[i].state = EnemyState::Chasing;
			summoned = summoned + 1;
		}

		return summoned;
	}

	int getVillageGateX(const Boss& boss) {
		return (boss.arenaFirst + boss.arenaLast) / 2;
	}

	int getVillageGateY(const Boss& boss) {
		return boss.arenaLast + 1;
	}

	void openVillageGate(Maze& maze, const Boss& boss) {
		int x = getVillageGateX(boss);
		int y = getVillageGateY(boss);

		if (y < 0 || y >= int(maze.tiles.size())) {
			return;
		}

		for (int gateX = x - villageGateHalfWidth; gateX <= x + villageGateHalfWidth; gateX++) {
			if (gateX >= 0 && gateX < int(maze.tiles.size())) {
				maze.tiles[y][gateX] = Tile::Path;
			}
		}
	}

	bool isBossFightEnemyBlocked(const Maze& maze, double x, double y) {
		int left = int(std::floor(x - enemyRadius));
		int right = int(std::floor(x + enemyRadius));
		int top = int(std::floor(y - enemyRadius));
		int bottom = int(std::floor(y + enemyRadius));

		for (int tileY = top; tileY <= bottom; tileY++) {
			for (int tileX = left; tileX <= right; tileX++) {
				if (isBossFightWallAt(maze, tileX, tileY)) {
					return true;
				}
			}
		}

		return false;
	}

	void pushEnemiesFromBoss(const Boss& boss, std::vector<Enemy>& enemies, const Player& player, const Maze& maze) {
		double minimum = bossRadius + enemyRadius;

		for (size_t i = 0; i < enemies.size(); i++) {
			Enemy& enemy = enemies[i];
			if (enemy.state == EnemyState::Dead || enemy.state == EnemyState::Dormant) {
				continue;
			}

			double dx = enemy.x - boss.x;
			double dy = enemy.y - boss.y;
			double distance = std::sqrt(dx * dx + dy * dy);
			if (distance >= minimum) {
				continue;
			}

			if (distance < 0.0001) {
				dx = -std::sin(boss.facing);
				dy = std::cos(boss.facing);
				distance = 1.0;
			}

			double push = minimum - distance;
			double tangentX = -dy / distance;
			double tangentY = dx / distance;
			if (tangentX * (player.x - enemy.x) + tangentY * (player.y - enemy.y) < 0.0) {
				tangentX = -tangentX;
				tangentY = -tangentY;
			}

			double stepX = dx / distance * push + tangentX * push;
			double stepY = dy / distance * push + tangentY * push;

			if (!isBossFightEnemyBlocked(maze, enemy.x + stepX, enemy.y)) {
				enemy.x = enemy.x + stepX;
			}

			if (!isBossFightEnemyBlocked(maze, enemy.x, enemy.y + stepY)) {
				enemy.y = enemy.y + stepY;
			}
		}
	}

	ExitStatus checkVillageExit(const Player& player, const Maze& maze, const Boss& boss) {
		if (isPlayerDead(player)) {
			return ExitStatus::Failure;
		}

		int gateX = getVillageGateX(boss);
		int gateY = getVillageGateY(boss);
		int tileX = int(std::floor(player.x));
		bool atGate = tileX >= gateX - villageGateHalfWidth && tileX <= gateX + villageGateHalfWidth && player.y >= gateY - bossPlayerRadius - 0.05;

		if (!atGate) {
			return ExitStatus::NotOnExit;
		}

		if (isBossFightWallAt(maze, gateX, gateY)) {
			return ExitStatus::Locked;
		}

		if (player.y < gateY + 0.5) {
			return ExitStatus::NotOnExit;
		}

		return ExitStatus::Success;
	}
}
