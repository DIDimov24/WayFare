#include <cmath>
#include <vector>
#include "WayFare.Business/Combat/Weapons.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	const double swordArcCos = 0.7071068;
	const double pistolRayStep = 0.05;

	Combat createCombat() {
		Combat combat = { 0.0, 0.0 };
		return combat;
	}

	void updateCombat(Combat& combat, double deltaTime) {
		combat.swordCooldown = combat.swordCooldown - deltaTime;
		if (combat.swordCooldown < 0.0) {
			combat.swordCooldown = 0.0;
		}

		combat.pistolCooldown = combat.pistolCooldown - deltaTime;
		if (combat.pistolCooldown < 0.0) {
			combat.pistolCooldown = 0.0;
		}
	}

	bool damageEnemy(Enemy& enemy, int amount) {
		if (enemy.state == EnemyState::Dead || amount <= 0) {
			return false;
		}

		enemy.health = enemy.health - amount;
		enemy.hurtTime = enemyHurtDuration;

		if (enemy.health <= 0) {
			enemy.health = 0;
			enemy.state = EnemyState::Dead;
			enemy.attackTimer = 0.0;
			return true;
		}

		return false;
	}

	bool isWeaponWallAt(const Maze& maze, double x, double y) {
		int size = int(maze.tiles.size());
		int tileX = int(std::floor(x));
		int tileY = int(std::floor(y));

		if (tileX < 0 || tileY < 0 || tileX >= size || tileY >= size) {
			return true;
		}

		return maze.tiles[tileY][tileX] == Tile::Wall;
	}

	AttackResponse checkWeaponReady(const Player& player, const Inventory& inventory, ItemType weapon, double cooldown) {
		AttackResponse response = { true, "", AttackStatus::Miss, 0, 0, 0.0 };

		if (isPlayerDead(player)) {
			response.success = false;
			response.errorMessage = "Player is dead";
			response.status = AttackStatus::Failure;
			return response;
		}

		if (!hasItem(inventory, weapon)) {
			response.success = false;
			response.errorMessage = "Weapon not collected";
			response.status = AttackStatus::NoWeapon;
			return response;
		}

		if (cooldown > 0.0) {
			response.success = false;
			response.errorMessage = "Weapon is not ready";
			response.status = AttackStatus::Cooldown;
			return response;
		}

		return response;
	}

	void setAttackStatus(AttackResponse& response) {
		if (response.killCount > 0) {
			response.status = AttackStatus::Killed;
		}
		else if (response.hitCount > 0) {
			response.status = AttackStatus::Success;
		}
		else {
			response.status = AttackStatus::Miss;
		}
	}

	AttackResponse swingSword(Combat& combat, const Player& player, const Inventory& inventory, std::vector<Enemy>& enemies) {
		AttackResponse response = checkWeaponReady(player, inventory, ItemType::Sword, combat.swordCooldown);
		if (!response.success) {
			return response;
		}

		combat.swordCooldown = swordCooldownTime;

		double forwardX = std::cos(player.facing);
		double forwardY = std::sin(player.facing);

		for (size_t i = 0; i < enemies.size(); i++) {
			if (enemies[i].state == EnemyState::Dead) {
				continue;
			}

			double dx = enemies[i].x - player.x;
			double dy = enemies[i].y - player.y;
			double distance = std::sqrt(dx * dx + dy * dy);

			if (distance > swordRange) {
				continue;
			}

			if (distance > 0.0001 && (dx * forwardX + dy * forwardY) / distance < swordArcCos) {
				continue;
			}

			response.hitCount = response.hitCount + 1;
			if (damageEnemy(enemies[i], swordDamage)) {
				response.killCount = response.killCount + 1;
			}
		}

		response.distance = swordRange;
		setAttackStatus(response);
		return response;
	}

	AttackResponse firePistol(Combat& combat, const Player& player, const Inventory& inventory, const Maze& maze, std::vector<Enemy>& enemies) {
		AttackResponse response = checkWeaponReady(player, inventory, ItemType::Pistol, combat.pistolCooldown);
		if (!response.success) {
			return response;
		}

		combat.pistolCooldown = pistolCooldownTime;

		double forwardX = std::cos(player.facing);
		double forwardY = std::sin(player.facing);
		int steps = int(pistolRange / pistolRayStep);

		response.distance = pistolRange;

		for (int step = 1; step <= steps; step++) {
			double distance = double(step) * pistolRayStep;
			double rayX = player.x + forwardX * distance;
			double rayY = player.y + forwardY * distance;

			if (isWeaponWallAt(maze, rayX, rayY)) {
				response.distance = distance;
				break;
			}

			bool hit = false;

			for (size_t i = 0; i < enemies.size(); i++) {
				if (enemies[i].state == EnemyState::Dead) {
					continue;
				}

				double dx = enemies[i].x - rayX;
				double dy = enemies[i].y - rayY;

				if (dx * dx + dy * dy <= pistolHitRadius * pistolHitRadius) {
					response.hitCount = 1;
					if (damageEnemy(enemies[i], pistolDamage)) {
						response.killCount = 1;
					}
					hit = true;
					break;
				}
			}

			if (hit) {
				response.distance = distance;
				break;
			}
		}

		setAttackStatus(response);
		return response;
	}
}
