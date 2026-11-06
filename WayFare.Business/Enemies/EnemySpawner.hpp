#pragma once

#include <cstdint>
#include <vector>

#include "WayFare.Business/models/Enemy.hpp"
#include "WayFare.Business/models/Maze.hpp"

namespace WayFare::Business {
	const int dungeonZombieCount = 8;
	const int villageCreatureCount = 16;
	const int villageArenaSize = 15;
	const int enemyMinStartDistance = 6;
	const int zombieMaxHealth = 3;
	const int nightmareCreatureMaxHealth = 4;

	Enemy createEnemy(EnemyType type, double x, double y);

	std::vector<Enemy> spawnEnemies(const Maze& maze, uint32_t seed, EnemyType type, int count, int arenaSize);
}
