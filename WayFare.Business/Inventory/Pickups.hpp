#pragma once

#include <cstdint>
#include <vector>

#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	std::vector<Pickup> placePickups(const Maze& maze, uint32_t seed, const std::vector<ItemType>& levelItems);

	std::vector<ItemType> collectPickups(const Player& player, Inventory& inventory, std::vector<Pickup>& pickups);
}
