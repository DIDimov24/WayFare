#include <cmath>
#include <vector>
#include "WayFare.Business/Enemies/EnemyAI.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	const double enemyMaxDeltaTime = 0.1;
	const double enemyStopDistance = 0.6;

	struct EnemyGridTile {
		int x;
		int y;
	};

	double getEnemySpeed(EnemyType type) {
		if (type == EnemyType::NightmareCreature) {
			return 1.6;
		}
		return 1.0;
	}

	int getEnemyDetectionRange(EnemyType type) {
		if (type == EnemyType::NightmareCreature) {
			return 12;
		}
		return 8;
	}

	double getEnemyWindup(EnemyType type) {
		if (type == EnemyType::NightmareCreature) {
			return 0.4;
		}
		return 0.6;
	}

	double getEnemyCooldown(EnemyType type) {
		if (type == EnemyType::NightmareCreature) {
			return 1.0;
		}
		return 1.2;
	}

	int getEnemyDamage(EnemyType type) {
		if (type == EnemyType::NightmareCreature) {
			return 2;
		}
		return 1;
	}

	bool isEnemyWallAt(const Maze& maze, int x, int y) {
		int size = int(maze.tiles.size());

		if (x < 0 || y < 0 || x >= size || y >= size) {
			return true;
		}

		return maze.tiles[y][x] == Tile::Wall;
	}

	bool isEnemyBlocked(const Maze& maze, double x, double y) {
		int left = int(std::floor(x - enemyRadius));
		int right = int(std::floor(x + enemyRadius));
		int top = int(std::floor(y - enemyRadius));
		int bottom = int(std::floor(y + enemyRadius));

		for (int tileY = top; tileY <= bottom; tileY++) {
			for (int tileX = left; tileX <= right; tileX++) {
				if (isEnemyWallAt(maze, tileX, tileY)) {
					return true;
				}
			}
		}

		return false;
	}

	std::vector<std::vector<int>> findEnemyPathDistances(const Maze& maze, int fromX, int fromY) {
		size_t size = maze.tiles.size();
		std::vector<std::vector<int>> distances(size, std::vector<int>(size, -1));

		if (isEnemyWallAt(maze, fromX, fromY)) {
			return distances;
		}

		std::vector<EnemyGridTile> directions = { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 } };
		std::vector<EnemyGridTile> queue;
		queue.push_back({ fromX, fromY });
		distances[fromY][fromX] = 0;

		for (size_t head = 0; head < queue.size(); head++) {
			EnemyGridTile tile = queue[head];

			for (size_t i = 0; i < directions.size(); i++) {
				int nextX = tile.x + directions[i].x;
				int nextY = tile.y + directions[i].y;

				if (isEnemyWallAt(maze, nextX, nextY) || distances[nextY][nextX] >= 0) {
					continue;
				}

				distances[nextY][nextX] = distances[tile.y][tile.x] + 1;
				queue.push_back({ nextX, nextY });
			}
		}

		return distances;
	}

	void moveEnemyTowards(Enemy& enemy, const Maze& maze, double targetX, double targetY, double maxStep) {
		double dx = targetX - enemy.x;
		double dy = targetY - enemy.y;
		double length = std::sqrt(dx * dx + dy * dy);

		if (length <= 0.0001 || maxStep <= 0.0) {
			return;
		}

		double step = maxStep;
		if (step > length) {
			step = length;
		}

		double stepX = dx / length * step;
		double stepY = dy / length * step;

		enemy.facing = std::atan2(dy, dx);

		if (!isEnemyBlocked(maze, enemy.x + stepX, enemy.y)) {
			enemy.x = enemy.x + stepX;
		}

		if (!isEnemyBlocked(maze, enemy.x, enemy.y + stepY)) {
			enemy.y = enemy.y + stepY;
		}
	}

	void attackPlayerWithEnemy(Enemy& enemy, Player& player, double playerDistance, EnemyUpdateResponse& response) {
		enemy.attackTimer = 0.0;
		enemy.cooldown = getEnemyCooldown(enemy.type);
		enemy.state = EnemyState::Chasing;

		if (playerDistance > enemyAttackRange || isPlayerDead(player)) {
			return;
		}

		DamageStatus status = damagePlayer(player, getEnemyDamage(enemy.type));

		if (status == DamageStatus::Success) {
			response.playerHit = true;
		}

		if (status == DamageStatus::Died) {
			response.playerHit = true;
			response.playerDied = true;
		}
	}

	EnemyUpdateResponse updateEnemies(std::vector<Enemy>& enemies, Player& player, const Maze& maze, double deltaTime) {
		EnemyUpdateResponse response = { true, "", false, false };

		if (isPlayerDead(player)) {
			response.success = false;
			response.errorMessage = "Player is dead";
			return response;
		}

		if (deltaTime > enemyMaxDeltaTime) {
			deltaTime = enemyMaxDeltaTime;
		}

		std::vector<std::vector<int>> distances = findEnemyPathDistances(maze, int(player.x), int(player.y));
		std::vector<EnemyGridTile> directions = { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 } };

		for (size_t i = 0; i < enemies.size(); i++) {
			Enemy& enemy = enemies[i];

			enemy.hurtTime = enemy.hurtTime - deltaTime;
			if (enemy.hurtTime < 0.0) {
				enemy.hurtTime = 0.0;
			}

			if (enemy.state == EnemyState::Dead || enemy.state == EnemyState::Dormant) {
				continue;
			}

			enemy.cooldown = enemy.cooldown - deltaTime;
			if (enemy.cooldown < 0.0) {
				enemy.cooldown = 0.0;
			}

			double toPlayerX = player.x - enemy.x;
			double toPlayerY = player.y - enemy.y;
			double playerDistance = std::sqrt(toPlayerX * toPlayerX + toPlayerY * toPlayerY);

			if (enemy.state == EnemyState::Attacking) {
				enemy.facing = std::atan2(toPlayerY, toPlayerX);
				enemy.attackTimer = enemy.attackTimer - deltaTime;

				if (enemy.attackTimer <= 0.0) {
					attackPlayerWithEnemy(enemy, player, playerDistance, response);
				}

				continue;
			}

			if (enemy.state == EnemyState::Alerted) {
				enemy.facing = std::atan2(toPlayerY, toPlayerX);
				enemy.alertTime = enemy.alertTime - deltaTime;

				if (enemy.alertTime <= 0.0) {
					enemy.alertTime = 0.0;
					enemy.state = EnemyState::Chasing;
				}

				continue;
			}

			int tileX = int(enemy.x);
			int tileY = int(enemy.y);
			int pathDistance = distances[tileY][tileX];

			if (pathDistance < 0 || pathDistance > getEnemyDetectionRange(enemy.type)) {
				enemy.state = EnemyState::Idle;
				continue;
			}

			if (enemy.type == EnemyType::Zombie && !enemy.alerted) {
				enemy.alerted = true;
				enemy.alertTime = zombieAlertDuration;
				enemy.state = EnemyState::Alerted;
				enemy.facing = std::atan2(toPlayerY, toPlayerX);
				continue;
			}

			enemy.state = EnemyState::Chasing;

			if (enemy.hurtTime > 0.0) {
				continue;
			}

			if (playerDistance <= enemyAttackRange) {
				enemy.facing = std::atan2(toPlayerY, toPlayerX);

				if (enemy.cooldown <= 0.0 && !isPlayerDead(player)) {
					enemy.state = EnemyState::Attacking;
					enemy.attackTimer = getEnemyWindup(enemy.type);
				}

				continue;
			}

			double maxStep = getEnemySpeed(enemy.type) * deltaTime;

			if (pathDistance <= 1) {
				double closeStep = playerDistance - enemyStopDistance;
				if (closeStep < maxStep) {
					maxStep = closeStep;
				}

				moveEnemyTowards(enemy, maze, player.x, player.y, maxStep);
				continue;
			}

			for (size_t d = 0; d < directions.size(); d++) {
				int nextX = tileX + directions[d].x;
				int nextY = tileY + directions[d].y;

				if (!isEnemyWallAt(maze, nextX, nextY) && distances[nextY][nextX] == pathDistance - 1) {
					moveEnemyTowards(enemy, maze, double(nextX) + 0.5, double(nextY) + 0.5, maxStep);
					break;
				}
			}
		}

		return response;
	}
}
