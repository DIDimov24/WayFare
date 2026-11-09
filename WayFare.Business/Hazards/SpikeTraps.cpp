#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <random>
#include <vector>
#include "WayFare.Business/Hazards/SpikeTraps.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	const double spikeTrapMaxDeltaTime = 0.1;

	struct SpikeTrapTile {
		int x;
		int y;
	};

	bool isPickupOnTrapTile(const std::vector<Pickup>& pickups, int x, int y) {
		for (size_t i = 0; i < pickups.size(); i++) {
			if (pickups[i].x == x && pickups[i].y == y) {
				return true;
			}
		}

		return false;
	}

	std::vector<SpikeTrap> placeSpikeTraps(const Maze& maze, uint32_t seed, int count, const std::vector<Pickup>& pickups) {
		int startX = 1;
		int startY = 1;

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] == Tile::Start) {
					startX = int(x);
					startY = int(y);
				}
			}
		}

		std::vector<SpikeTrapTile> freeTiles;

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] != Tile::Path) {
					continue;
				}

				int distance = std::abs(int(x) - startX) + std::abs(int(y) - startY);
				if (distance < spikeTrapMinStartDistance) {
					continue;
				}

				if (isPickupOnTrapTile(pickups, int(x), int(y))) {
					continue;
				}

				freeTiles.push_back({ int(x), int(y) });
			}
		}

		std::mt19937 rng(seed ^ 0x5eed0002u);
		std::vector<SpikeTrap> traps;

		for (int i = 0; i < count && !freeTiles.empty(); i++) {
			size_t index = rng() % freeTiles.size();
			SpikeTrapTile tile = freeTiles[index];

			freeTiles[index] = freeTiles[freeTiles.size() - 1];
			freeTiles.pop_back();

			double timer = double(rng() % 30) / 10.0;
			traps.push_back({ tile.x, tile.y, timer });
		}

		return traps;
	}

	TrapState getSpikeTrapState(const SpikeTrap& trap) {
		if (trap.timer < spikeHiddenTime) {
			return TrapState::Hidden;
		}

		if (trap.timer < spikeHiddenTime + spikeRiseTime) {
			return TrapState::Rising;
		}

		if (trap.timer < spikeHiddenTime + spikeRiseTime + spikeUpTime) {
			return TrapState::Up;
		}

		return TrapState::Lowering;
	}

	double getSpikeTrapHeight(const SpikeTrap& trap) {
		TrapState state = getSpikeTrapState(trap);

		if (state == TrapState::Hidden) {
			return 0.0;
		}

		if (state == TrapState::Rising) {
			return (trap.timer - spikeHiddenTime) / spikeRiseTime;
		}

		if (state == TrapState::Up) {
			return 1.0;
		}

		double lowered = (trap.timer - spikeHiddenTime - spikeRiseTime - spikeUpTime) / spikeLowerTime;
		if (lowered > 1.0) {
			lowered = 1.0;
		}

		return 1.0 - lowered;
	}

	TrapUpdateResponse updateSpikeTraps(std::vector<SpikeTrap>& traps, Player& player, double deltaTime) {
		TrapUpdateResponse response = { true, "", false, false };

		if (isPlayerDead(player)) {
			response.success = false;
			response.errorMessage = "Player is dead";
			return response;
		}

		if (deltaTime > spikeTrapMaxDeltaTime) {
			deltaTime = spikeTrapMaxDeltaTime;
		}

		int playerTileX = int(player.x);
		int playerTileY = int(player.y);
		bool onRaisedSpikes = false;

		for (size_t i = 0; i < traps.size(); i++) {
			traps[i].timer = std::fmod(traps[i].timer + deltaTime, spikeCycleTime);

			if (traps[i].x != playerTileX || traps[i].y != playerTileY) {
				continue;
			}

			TrapState state = getSpikeTrapState(traps[i]);

			if (state == TrapState::Up || (state == TrapState::Rising && getSpikeTrapHeight(traps[i]) >= 0.5)) {
				onRaisedSpikes = true;
			}
		}

		if (!onRaisedSpikes) {
			return response;
		}

		DamageStatus status = damagePlayer(player, spikeTrapDamage);

		if (status == DamageStatus::Success) {
			response.playerHit = true;
		}

		if (status == DamageStatus::Died) {
			response.playerHit = true;
			response.playerDied = true;
		}

		return response;
	}
}
