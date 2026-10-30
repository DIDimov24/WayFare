#include "WayFare.Business/Hazards/Drowning.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	Drowning createDrowning() {
		Drowning drowning = { maxAir, drowningDamageInterval };
		return drowning;
	}

	DrowningStatus updateDrowning(Drowning& drowning, Player& player, const Inventory& inventory, double deltaTime) {
		if (isPlayerDead(player)) {
			return DrowningStatus::Failure;
		}

		if (hasItem(inventory, ItemType::DivingGear)) {
			drowning.air = maxAir;
			drowning.damageTimer = drowningDamageInterval;
			return DrowningStatus::Protected;
		}

		drowning.air = drowning.air - deltaTime;

		if (drowning.air > 0.0) {
			return DrowningStatus::Success;
		}

		drowning.air = 0.0;
		drowning.damageTimer = drowning.damageTimer - deltaTime;

		if (drowning.damageTimer <= 0.0) {
			drowning.damageTimer = 0.0;

			DamageStatus status = damagePlayer(player, 1);

			if (status == DamageStatus::Died) {
				return DrowningStatus::Died;
			}

			if (status == DamageStatus::Success) {
				drowning.damageTimer = drowningDamageInterval;
			}
		}

		return DrowningStatus::Drowning;
	}
}
