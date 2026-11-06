#pragma once

#include <cstdint>
#include <vector>

#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"
#include "WayFare.Business/models/Trap.hpp"

namespace WayFare::Business {
	const int dungeonSpikeTrapCount = 12;
	const int spikeTrapMinStartDistance = 4;
	const double spikeHiddenTime = 1.5;
	const double spikeRiseTime = 0.2;
	const double spikeUpTime = 1.0;
	const double spikeLowerTime = 0.3;
	const double spikeCycleTime = spikeHiddenTime + spikeRiseTime + spikeUpTime + spikeLowerTime;
	const int spikeTrapDamage = 1;

	std::vector<SpikeTrap> placeSpikeTraps(const Maze& maze, uint32_t seed, int count, const std::vector<Pickup>& pickups);

	TrapState getSpikeTrapState(const SpikeTrap& trap);

	double getSpikeTrapHeight(const SpikeTrap& trap);

	TrapUpdateResponse updateSpikeTraps(std::vector<SpikeTrap>& traps, Player& player, double deltaTime);
}
