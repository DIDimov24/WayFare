#pragma once

#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const int potionHealAmount = 4;

	Inventory createInventory();

	void addItem(Inventory& inventory, ItemType type);

	void removeItem(Inventory& inventory, ItemType type);

	bool hasItem(const Inventory& inventory, ItemType type);

	HealStatus usePotion(Player& player, Inventory& inventory);
}
