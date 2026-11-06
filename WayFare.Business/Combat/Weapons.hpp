#pragma once

#include <vector>

#include "WayFare.Business/models/Combat.hpp"
#include "WayFare.Business/models/Enemy.hpp"
#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const double swordCooldownTime = 0.5;
	const double swordRange = 1.2;
	const int swordDamage = 2;
	const double pistolCooldownTime = 0.4;
	const double pistolRange = 15.0;
	const double pistolHitRadius = 0.35;
	const int pistolDamage = 1;
	const double enemyHurtDuration = 0.3;

	Combat createCombat();

	void updateCombat(Combat& combat, double deltaTime);

	bool damageEnemy(Enemy& enemy, int amount);

	AttackResponse swingSword(Combat& combat, const Player& player, const Inventory& inventory, std::vector<Enemy>& enemies);

	AttackResponse firePistol(Combat& combat, const Player& player, const Inventory& inventory, const Maze& maze, std::vector<Enemy>& enemies);
}
