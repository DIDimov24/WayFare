#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/Player/PlayerMovement.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	TEST_CLASS(CollisionTests) {
	public:
		// T_003
		TEST_METHOD(WallCollision) {
			// A 5x5 maze with one corridor in row 1: start (1, 1), path (2, 1), exit (3, 1)
			Maze maze;
			maze.tiles = std::vector<std::vector<Tile>>(5, std::vector<Tile>(5, Tile::Wall));
			maze.tiles[1][1] = Tile::Start;
			maze.tiles[1][2] = Tile::Path;
			maze.tiles[1][3] = Tile::Exit;

			// 1. To stand in the centre of the start tile (1.5, 1.5)
			Player player = createPlayer(maze);
			Assert::AreEqual(1.5, player.x, 0.001);
			Assert::AreEqual(1.5, player.y, 0.001);
			Assert::IsFalse(isPlayerOnExit(player, maze));

			// 2. To stop at the wall (x ≥ 1.25)
			for (int i = 0; i < 10; i++) {
				movePlayer(player, maze, -1.0, 0.0, 0.1);
			}
			Assert::IsTrue(player.x >= 1.25);

			// 3. To slide along the wall (x > 2.5, y ≥ 1.25)
			for (int i = 0; i < 10; i++) {
				movePlayer(player, maze, 1.0, -1.0, 0.1);
			}
			Assert::IsTrue(player.x > 2.5);
			Assert::IsTrue(player.y >= 1.25);

			// 4. To stop at the wall (x ≤ 3.75) on the exit tile
			for (int i = 0; i < 20; i++) {
				movePlayer(player, maze, 1.0, 0.0, 0.1);
			}
			Assert::IsTrue(player.x <= 3.75);
			Assert::IsTrue(isPlayerOnExit(player, maze));

			// 5. To move only 0.2 tiles (frame time capped at 0.1 s)
			double before = player.x;
			movePlayer(player, maze, -1.0, 0.0, 5.0);
			Assert::AreEqual(0.2, before - player.x, 0.001);
		}
	};
}
