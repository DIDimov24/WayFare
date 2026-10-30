#include "WayFare.Business/Level/TempleExit.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"
#include "WayFare.Business/Player/PlayerMovement.hpp"

namespace WayFare::Business {
	bool isTempleExitUnlocked(const Inventory& inventory) {
		return hasItem(inventory, ItemType::Sword) && hasItem(inventory, ItemType::Pistol);
	}

	ExitStatus checkTempleExit(const Player& player, const Maze& maze, const Inventory& inventory) {
		if (isPlayerDead(player)) {
			return ExitStatus::Failure;
		}

		if (!isPlayerOnExit(player, maze)) {
			return ExitStatus::NotOnExit;
		}

		if (!isTempleExitUnlocked(inventory)) {
			return ExitStatus::Locked;
		}

		return ExitStatus::Success;
	}
}
