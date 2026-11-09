#include <cstdint>
#include <random>
#include <vector>
#include <WayFare.Business/Inventory/Inventory.hpp>
#include <WayFare.Business/Inventory/Pickups.hpp>

namespace WayFare::Business {
	struct PickupTile {
		int x;
		int y;
	};

	std::vector<Pickup> placePickups(const Maze& maze, uint32_t seed, const std::vector<ItemType>& levelItems) {
		std::vector<PickupTile> freeTiles;

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] == Tile::Path) {
					freeTiles.push_back({ int(x), int(y) });
				}
			}
		}

		std::mt19937 rng(seed);

		std::vector<ItemType> types = levelItems;
		int potionCount = 2 + int(rng() % 2);

		for (int i = 0; i < potionCount; i++) {
			types.push_back(ItemType::Potion);
		}

		std::vector<Pickup> pickups;

		for (size_t i = 0; i < types.size() && !freeTiles.empty(); i++) {
			size_t index = rng() % freeTiles.size();
			PickupTile tile = freeTiles[index];

			freeTiles[index] = freeTiles[freeTiles.size() - 1];
			freeTiles.pop_back();

			pickups.push_back({ types[i], tile.x, tile.y, false });
		}

		return pickups;
	}

	std::vector<ItemType> collectPickups(const Player& player, Inventory& inventory, std::vector<Pickup>& pickups) {
		std::vector<ItemType> collected;
		int tileX = int(player.x);
		int tileY = int(player.y);

		for (size_t i = 0; i < pickups.size(); i++) {
			if (!pickups[i].collected && pickups[i].x == tileX && pickups[i].y == tileY) {
				pickups[i].collected = true;
				addItem(inventory, pickups[i].type);
				collected.push_back(pickups[i].type);
			}
		}

		return collected;
	}

	void removeOwnedPickups(std::vector<Pickup>& pickups, const Inventory& inventory) {
		for (size_t i = 0; i < pickups.size(); i++) {
			if (pickups[i].type != ItemType::Potion && hasItem(inventory, pickups[i].type)) {
				pickups[i].collected = true;
			}
		}
	}
}
