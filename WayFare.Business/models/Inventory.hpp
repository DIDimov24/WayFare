#pragma once

#include <vector>

namespace WayFare::Business {
	enum class ItemType {
		DivingGear,
		Sword,
		Pistol,
		Potion
	};

	enum class HealStatus {
		Success,
		Failure,
		NoPotions,
		FullHealth
	};

	struct Inventory {
		std::vector<ItemType> items;
		int potionCount;
	};

	struct Pickup {
		ItemType type;
		int x;
		int y;
		bool collected;
	};
}
