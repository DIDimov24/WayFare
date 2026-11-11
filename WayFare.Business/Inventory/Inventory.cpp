#include <WayFare.Business/Inventory/Inventory.hpp>
#include <WayFare.Business/Player/PlayerHealth.hpp>

namespace WayFare::Business {
	Inventory createInventory() {
		Inventory inventory = { {}, 0 };
		return inventory;
	}

	void addItem(Inventory& inventory, ItemType type) {
		if (type == ItemType::Potion) {
			inventory.potionCount = inventory.potionCount + 1;
			return;
		}

		if (!hasItem(inventory, type)) {
			inventory.items.push_back(type);
		}
	}

	void removeItem(Inventory& inventory, ItemType type) {
		std::vector<ItemType> kept;
		for (size_t i = 0; i < inventory.items.size(); i++) {
			if (inventory.items[i] != type) {
				kept.push_back(inventory.items[i]);
			}
		}
		inventory.items = kept;
	}

	bool hasItem(const Inventory& inventory, ItemType type) {
		if (type == ItemType::Potion) {
			return inventory.potionCount > 0;
		}

		for (size_t i = 0; i < inventory.items.size(); i++) {
			if (inventory.items[i] == type) {
				return true;
			}
		}

		return false;
	}

	HealStatus usePotion(Player& player, Inventory& inventory) {
		if (isPlayerDead(player)) {
			return HealStatus::Failure;
		}

		if (inventory.potionCount <= 0) {
			return HealStatus::NoPotions;
		}

		if (player.health >= maxPlayerHealth) {
			return HealStatus::FullHealth;
		}

		inventory.potionCount = inventory.potionCount - 1;
		player.health = player.health + potionHealAmount;

		if (player.health > maxPlayerHealth) {
			player.health = maxPlayerHealth;
		}

		return HealStatus::Success;
	}
}
