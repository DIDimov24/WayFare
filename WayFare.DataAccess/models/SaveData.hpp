#pragma once

#include <cstdint>
#include <string>
#include <vector>

namespace WayFare::DataAccess {
	enum class SaveStatus {
		Success,
		Failure
	};

	struct SaveData {
		int level;
		uint32_t seed;
		double playerX;
		double playerY;
		double facing;
		int health;
		std::vector<std::string> items;
		int potionCount;
	};

	struct LoadSaveResponse {
		bool success;
		std::string errorMessage;
		SaveData save;
	};
}
