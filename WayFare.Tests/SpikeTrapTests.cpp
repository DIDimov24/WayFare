#include "CppUnitTest.h"
#include <cstdlib>
#include <vector>
#include "WayFare.Business/Hazards/SpikeTraps.hpp"
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	void runSpikeTrapFrames(std::vector<SpikeTrap>& traps, Player& player, int frames) {
		for (int i = 0; i < frames; i++) {
			updatePlayerHealth(player, 0.1);
			updateSpikeTraps(traps, player, 0.1);
		}
	}

	TEST_CLASS(SpikeTrapTests) {
	public:
		// T_010
		TEST_METHOD(SpikeTrapCycle) {
			// 1. 12 traps, all on path tiles at least 4 tiles from the start
			Maze maze = generateMaze(25, 7);
			std::vector<SpikeTrap> placed = placeSpikeTraps(maze, 7, dungeonSpikeTrapCount, {});
			Assert::AreEqual(12, int(placed.size()));
			for (size_t i = 0; i < placed.size(); i++) {
				Assert::IsTrue(maze.tiles[placed[i].y][placed[i].x] == Tile::Path);
				Assert::IsTrue(std::abs(placed[i].x - 1) + std::abs(placed[i].y - 1) >= spikeTrapMinStartDistance);
			}

			// 2. Hidden at 0 s, rising at 1.6 s, up at 2 s, lowering at 2.85 s
			SpikeTrap trap = { 3, 1, 0.0 };
			Assert::IsTrue(getSpikeTrapState(trap) == TrapState::Hidden);
			Assert::AreEqual(0.0, getSpikeTrapHeight(trap), 0.001);
			trap.timer = 1.6;
			Assert::IsTrue(getSpikeTrapState(trap) == TrapState::Rising);
			Assert::AreEqual(0.5, getSpikeTrapHeight(trap), 0.001);
			trap.timer = 2.0;
			Assert::IsTrue(getSpikeTrapState(trap) == TrapState::Up);
			Assert::AreEqual(1.0, getSpikeTrapHeight(trap), 0.001);
			trap.timer = 2.85;
			Assert::IsTrue(getSpikeTrapState(trap) == TrapState::Lowering);
			Assert::AreEqual(0.5, getSpikeTrapHeight(trap), 0.001);

			// 3. No damage from hidden spikes, still 8 hearts
			std::vector<SpikeTrap> traps = { { 3, 1, 0.0 } };
			Player player = { 3.5, 1.5, 0.0, maxPlayerHealth, 0.0 };
			runSpikeTrapFrames(traps, player, 10);
			Assert::AreEqual(8, player.health);

			// 4. Hit once the spikes come up (7 hearts)
			runSpikeTrapFrames(traps, player, 10);
			Assert::IsTrue(getSpikeTrapState(traps[0]) == TrapState::Up);
			Assert::AreEqual(7, player.health);

			// 5. No damage next to the trap for a whole cycle, still 7 hearts
			player.x = 2.5;
			runSpikeTrapFrames(traps, player, 30);
			Assert::AreEqual(7, player.health);

			// 6. Trap timer moves only 0.1 s (frame time capped)
			traps[0].timer = 0.0;
			updateSpikeTraps(traps, player, 5.0);
			Assert::AreEqual(0.1, traps[0].timer, 0.001);
		}
	};
}
