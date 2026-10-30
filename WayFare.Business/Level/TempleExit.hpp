#pragma once

#include <string>
#include "WayFare.Business/models/Exit.hpp"
#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const std::string templeExitLockedMessage = "Find all resources first";

	bool isTempleExitUnlocked(const Inventory& inventory);

	ExitStatus checkTempleExit(const Player& player, const Maze& maze, const Inventory& inventory);
}
