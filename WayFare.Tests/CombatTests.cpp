#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/Combat/Weapons.hpp"
#include "WayFare.Business/Enemies/EnemySpawner.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	Maze createCombatTestMaze() {
		Maze maze;
		maze.tiles = std::vector<std::vector<Tile>>(9, std::vector<Tile>(9, Tile::Wall));
		maze.tiles[1][1] = Tile::Start;

		for (int x = 2; x <= 7; x++) {
			maze.tiles[1][x] = Tile::Path;
		}

		return maze;
	}

	TEST_CLASS(CombatTests) {
	public:
		// T_008
		TEST_METHOD(SwordAndPistol) {
			// A 9x9 maze with one corridor in row 1, from (1, 1) to (7, 1)
			Maze maze = createCombatTestMaze();
			Player player = { 1.5, 1.5, 0.0, maxPlayerHealth, 0.0 };
			Inventory inventory = createInventory();
			Combat combat = createCombat();
			std::vector<Enemy> enemies = { createEnemy(EnemyType::Zombie, 2.5, 1.5) };

			// 1. Attack rejected, zombie keeps 3 health
			Assert::IsTrue(swingSword(combat, player, inventory, enemies).status == AttackStatus::NoWeapon);
			Assert::AreEqual(3, enemies[0].health);

			// 2. Zombie hit for 2 (1 health left)
			addItem(inventory, ItemType::Sword);
			AttackResponse response = swingSword(combat, player, inventory, enemies);
			Assert::IsTrue(response.status == AttackStatus::Success);
			Assert::AreEqual(1, response.hitCount);
			Assert::AreEqual(1, enemies[0].health);

			// 3. Swing rejected, still 1 health
			Assert::IsTrue(swingSword(combat, player, inventory, enemies).status == AttackStatus::Cooldown);
			Assert::AreEqual(1, enemies[0].health);

			// 4. Zombie killed (0 health, dead)
			updateCombat(combat, swordCooldownTime);
			response = swingSword(combat, player, inventory, enemies);
			Assert::IsTrue(response.status == AttackStatus::Killed);
			Assert::AreEqual(1, response.killCount);
			Assert::AreEqual(0, enemies[0].health);
			Assert::IsTrue(enemies[0].state == EnemyState::Dead);

			// 5. Far zombie hit for 1 (2 health left), the dead one is skipped
			addItem(inventory, ItemType::Pistol);
			enemies.push_back(createEnemy(EnemyType::Zombie, 5.5, 1.5));
			response = firePistol(combat, player, inventory, maze, enemies);
			Assert::IsTrue(response.status == AttackStatus::Success);
			Assert::AreEqual(2, enemies[1].health);

			// 6. Shot stops at the wall (0.5 to 0.55 tiles away), zombie behind it not hit
			updateCombat(combat, pistolCooldownTime);
			player.facing = 1.5707963;
			enemies.push_back(createEnemy(EnemyType::Zombie, 1.5, 3.5));
			response = firePistol(combat, player, inventory, maze, enemies);
			Assert::IsTrue(response.status == AttackStatus::Miss);
			Assert::IsTrue(response.distance >= 0.5 && response.distance <= 0.55);
			Assert::AreEqual(3, enemies[2].health);
		}
	};
}
