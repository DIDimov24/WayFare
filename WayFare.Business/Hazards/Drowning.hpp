#pragma once

#include "WayFare.Business/models/Drowning.hpp"
#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const double maxAir = 45.0;
	const double drowningDamageInterval = 3.0;

	Drowning createDrowning();

	DrowningStatus updateDrowning(Drowning& drowning, Player& player, const Inventory& inventory, double deltaTime);
}
