#pragma once

#include <vector>

#include "WayFare.Business/models/Enemy.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const double enemyRadius = 0.3;
	const double enemyAttackRange = 0.8;

	EnemyUpdateResponse updateEnemies(std::vector<Enemy>& enemies, Player& player, const Maze& maze, double deltaTime);
}
