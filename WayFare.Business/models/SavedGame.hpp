#pragma once

#include <cstdint>
#include <string>

#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	enum class SaveGameStatus {
		Success,
		Failure
	};

	struct SavedGame {
		int level;
		uint32_t seed;
		Player player;
		Inventory inventory;
	};

	struct LoadGameResponse {
		bool success;
		std::string errorMessage;
		SavedGame game;
	};
}
