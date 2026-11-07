#pragma once

#include <string>
#include <vector>
#include "WayFare.Business/models/Boss.hpp"
#include "WayFare.Business/models/Enemy.hpp"
#include "WayFare.Business/models/Exit.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const int bossMaxHealth = 75;
	const int bossPhaseCount = 3;
	const double bossRadius = 0.7;
	const double bossIntroDuration = 4.5;
	const double bossRoarDuration = 2.3;
	const double bossDeathDuration = 3.0;
	const double bossSwipeHitTime = 1.05;
	const double bossSwipeDuration = 2.0;
	const double bossSwipeRange = 2.0;
	const int bossSwipeDamage = 1;
	const double bossSlamHitTime = 0.95;
	const double bossSlamDuration = 3.2;
	const double bossSlamRadius = 2.6;
	const int bossSlamDamage = 2;
	const double bossChargeWindup = 0.9;
	const double bossChargeTime = 1.6;
	const double bossChargeSpeed = 5.0;
	const int bossChargeDamage = 2;
	const double bossRecoverDuration = 1.6;
	const int bossMinionCount = 5;
	const double bossMinionDistance = 1.6;
	const int villageGateHalfWidth = 1;
	const std::string villageExitLockedMessage = "Defeat the Cave Troll first";

	Boss createBoss(const Maze& maze, int arenaSize);

	int getBossPhase(int health);

	bool isPlayerInArena(const Boss& boss, const Player& player);

	bool isBossCutscenePlaying(const Boss& boss);

	bool isArenaLocked(const Boss& boss);

	void keepPlayerInArena(const Boss& boss, Player& player);

	BossUpdateResponse updateBoss(Boss& boss, Player& player, const Maze& maze, double deltaTime);

	BossHitStatus damageBoss(Boss& boss, int amount);

	BossHitStatus hitBossWithSword(Boss& boss, const Player& player);

	BossHitStatus hitBossWithPistol(Boss& boss, const Player& player, double range);

	int getVillageGateX(const Boss& boss);

	int getVillageGateY(const Boss& boss);

	void openVillageGate(Maze& maze, const Boss& boss);

	ExitStatus checkVillageExit(const Player& player, const Maze& maze, const Boss& boss);

	std::vector<Enemy> createBossMinions(const Boss& boss);

	int summonBossMinions(std::vector<Enemy>& enemies, const Boss& boss);

	void pushEnemiesFromBoss(const Boss& boss, std::vector<Enemy>& enemies, const Player& player, const Maze& maze);
}
