#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/Enemies/EnemySpawner.hpp"
#include "WayFare.Business/Hazards/SpikeTraps.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Inventory/Pickups.hpp"
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	bool isSavedPickupCollected(const std::vector<Pickup>& pickups, ItemType type) {
		for (size_t i = 0; i < pickups.size(); i++) {
			if (pickups[i].type == type) {
				return pickups[i].collected;
			}
		}

		return false;
	}

	TEST_CLASS(SaveLoadTests) {
	public:
		// T_012
		TEST_METHOD(ResumeFromSeed) {
			// The saved dungeon level is rebuilt from its seed (1234) on resume
			Maze saved = generateMaze(25, 1234);
			Maze loaded = generateMaze(25, 1234);

			// 1. Exactly the same maze
			for (size_t y = 0; y < saved.tiles.size(); y++) {
				for (size_t x = 0; x < saved.tiles[y].size(); x++) {
					Assert::IsTrue(saved.tiles[y][x] == loaded.tiles[y][x]);
				}
			}

			// 2. The same 14 zombies on the same tiles
			std::vector<Enemy> savedEnemies = spawnEnemies(saved, 1234, EnemyType::Zombie, dungeonZombieCount, 0);
			std::vector<Enemy> loadedEnemies = spawnEnemies(loaded, 1234, EnemyType::Zombie, dungeonZombieCount, 0);
			Assert::AreEqual(14, int(loadedEnemies.size()));
			for (size_t i = 0; i < savedEnemies.size(); i++) {
				Assert::AreEqual(savedEnemies[i].x, loadedEnemies[i].x, 0.001);
				Assert::AreEqual(savedEnemies[i].y, loadedEnemies[i].y, 0.001);
				Assert::AreEqual(3, loadedEnemies[i].health);
			}

			// 3. The same 12 spike traps on the same tiles
			std::vector<SpikeTrap> savedTraps = placeSpikeTraps(saved, 1234, dungeonSpikeTrapCount, {});
			std::vector<SpikeTrap> loadedTraps = placeSpikeTraps(loaded, 1234, dungeonSpikeTrapCount, {});
			Assert::AreEqual(12, int(loadedTraps.size()));
			for (size_t i = 0; i < savedTraps.size(); i++) {
				Assert::AreEqual(savedTraps[i].x, loadedTraps[i].x);
				Assert::AreEqual(savedTraps[i].y, loadedTraps[i].y);
			}

			// 4. Sword pickup hidden, diving gear, pistol and potions still on the map
			Maze temple = generateMaze(15, 1234);
			std::vector<Pickup> pickups = placePickups(temple, 1234, { ItemType::DivingGear, ItemType::Sword, ItemType::Pistol });
			Inventory inventory = createInventory();
			addItem(inventory, ItemType::Sword);
			removeOwnedPickups(pickups, inventory);
			Assert::IsTrue(isSavedPickupCollected(pickups, ItemType::Sword));
			Assert::IsFalse(isSavedPickupCollected(pickups, ItemType::DivingGear));
			Assert::IsFalse(isSavedPickupCollected(pickups, ItemType::Pistol));
			Assert::IsFalse(isSavedPickupCollected(pickups, ItemType::Potion));

			// 5. Nothing picked up on the hidden sword's tile
			Pickup sword = pickups[1];
			Assert::IsTrue(sword.type == ItemType::Sword);
			Player player = { sword.x + 0.5, sword.y + 0.5, 0.0, maxPlayerHealth, 0.0 };
			Assert::AreEqual(0, int(collectPickups(player, inventory, pickups).size()));
			Assert::AreEqual(1, int(inventory.items.size()));
		}
	};
}
