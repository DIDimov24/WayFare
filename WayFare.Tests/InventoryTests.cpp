#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Inventory/Pickups.hpp"
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	TEST_CLASS(InventoryTests) {
	public:
		// T_005
		TEST_METHOD(ItemsAndPotions) {
			Inventory inventory = createInventory();
			Player player = { 1.5, 1.5, 0.0, maxPlayerHealth, 0.0 };

			// 1. No items, 0 potions
			Assert::AreEqual(0, int(inventory.items.size()));
			Assert::AreEqual(0, inventory.potionCount);
			Assert::IsFalse(hasItem(inventory, ItemType::Sword));

			// 2. Only 1 sword in the inventory
			addItem(inventory, ItemType::Sword);
			addItem(inventory, ItemType::Sword);
			Assert::AreEqual(1, int(inventory.items.size()));
			Assert::IsTrue(hasItem(inventory, ItemType::Sword));

			// 3. 2 potions, not added to the item list
			addItem(inventory, ItemType::Potion);
			addItem(inventory, ItemType::Potion);
			Assert::AreEqual(2, inventory.potionCount);
			Assert::AreEqual(1, int(inventory.items.size()));

			// 4. Potion not used, still 2 potions
			Assert::IsTrue(usePotion(player, inventory) == HealStatus::FullHealth);
			Assert::AreEqual(2, inventory.potionCount);

			// 5. 6 hearts (+4), 1 potion left
			player.health = 2;
			Assert::IsTrue(usePotion(player, inventory) == HealStatus::Success);
			Assert::AreEqual(6, player.health);
			Assert::AreEqual(1, inventory.potionCount);

			// 6. 8 hearts (capped), 0 potions
			Assert::IsTrue(usePotion(player, inventory) == HealStatus::Success);
			Assert::AreEqual(8, player.health);
			Assert::AreEqual(0, inventory.potionCount);

			// 7. Nothing healed, still 5 hearts
			player.health = 5;
			Assert::IsTrue(usePotion(player, inventory) == HealStatus::NoPotions);
			Assert::AreEqual(5, player.health);
		}

		// T_006
		TEST_METHOD(ItemPickups) {
			Maze maze = generateMaze(15, 7);
			std::vector<Pickup> pickups = placePickups(maze, 7, { ItemType::DivingGear, ItemType::Sword, ItemType::Pistol });

			// 1. 3 items and 2–3 potions placed
			int potions = 0;
			for (size_t i = 0; i < pickups.size(); i++) {
				if (pickups[i].type == ItemType::Potion) {
					potions++;
				}
			}
			Assert::AreEqual(3, int(pickups.size()) - potions);
			Assert::IsTrue(potions >= 2 && potions <= 3);

			// 2. Every item on a path tile, none in a wall
			for (size_t i = 0; i < pickups.size(); i++) {
				Assert::IsTrue(maze.tiles[pickups[i].y][pickups[i].x] == Tile::Path);
			}

			// 3. Sword picked up and in the inventory
			Inventory inventory = createInventory();
			Player player = { pickups[1].x + 0.5, pickups[1].y + 0.5, 0.0, maxPlayerHealth, 0.0 };
			std::vector<ItemType> collected = collectPickups(player, inventory, pickups);
			Assert::AreEqual(1, int(collected.size()));
			Assert::IsTrue(collected[0] == ItemType::Sword);
			Assert::IsTrue(hasItem(inventory, ItemType::Sword));

			// 4. Nothing more picked up
			collected = collectPickups(player, inventory, pickups);
			Assert::AreEqual(0, int(collected.size()));
		}
	};
}
