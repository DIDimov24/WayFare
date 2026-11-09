#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	struct TestCell {
		int x;
		int y;
	};

	int countOpenTiles(const Maze& maze) {
		int count = 0;

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] != Tile::Wall) {
					count++;
				}
			}
		}

		return count;
	}

	int countReachableTiles(const Maze& maze) {
		int size = int(maze.tiles.size());
		std::vector<std::vector<bool>> visited(size, std::vector<bool>(size, false));
		std::vector<TestCell> toVisit;

		toVisit.push_back({ 1, 1 });
		visited[1][1] = true;

		for (size_t i = 0; i < toVisit.size(); i++) {
			TestCell cell = toVisit[i];
			std::vector<TestCell> neighbours = { 
				{ cell.x + 1, cell.y },
				{ cell.x - 1, cell.y },
				{ cell.x, cell.y + 1 },
				{ cell.x, cell.y - 1 }
			};

			for (size_t j = 0; j < neighbours.size(); j++) {
				TestCell next = neighbours[j];

				if (next.x < 0 || next.y < 0 || next.x >= size || next.y >= size) {
					continue;
				}

				if (maze.tiles[next.y][next.x] != Tile::Wall && !visited[next.y][next.x]) {
					visited[next.y][next.x] = true;
					toVisit.push_back(next);
				}
			}
		}

		return int(toVisit.size());
	}

	TEST_CLASS(MazeGeneratorTests) {
	public:
		// T_001
		TEST_METHOD(MazeLayout) {
			Maze maze = generateMaze(15, 1);

			// 1. To have 15 rows of 15 tiles
			Assert::AreEqual(15, int(maze.tiles.size()));
			for (size_t y = 0; y < maze.tiles.size(); y++) {
				Assert::AreEqual(15, int(maze.tiles[y].size()));
			}

			// 2. All border tiles to be walls
			for (int i = 0; i < 15; i++) {
				Assert::IsTrue(maze.tiles[0][i] == Tile::Wall);
				Assert::IsTrue(maze.tiles[14][i] == Tile::Wall);
				Assert::IsTrue(maze.tiles[i][0] == Tile::Wall);
				Assert::IsTrue(maze.tiles[i][14] == Tile::Wall);
			}

			// 3. Start at the top-left cell (1, 1), exit at the bottom-right cell (13, 13)
			Assert::IsTrue(maze.tiles[1][1] == Tile::Start);
			Assert::IsTrue(maze.tiles[13][13] == Tile::Exit);

			// 4. To build exactly the same maze
			Assert::IsTrue(generateMaze(15, 1).tiles == maze.tiles);

			// 5. To build a different maze
			Assert::IsTrue(generateMaze(15, 2).tiles != maze.tiles);
		}

		// T_002
		TEST_METHOD(MazePaths) {
			std::vector<int> sizes = { 15, 25, 45 };

			for (size_t i = 0; i < sizes.size(); i++) {
				Maze maze = generateMaze(sizes[i], 7);
				int rooms = ((sizes[i] - 1) / 2) * ((sizes[i] - 1) / 2);

				// 1. Every open tile to be reachable
				Assert::AreEqual(countOpenTiles(maze), countReachableTiles(maze));

				// 2. 97 / 287 / 967 open tiles (perfect maze, no loops)
				Assert::AreEqual(rooms + rooms - 1, countOpenTiles(maze));
			}

			Maze village = generateMaze(45, 7);
			carveArena(village, 15);

			// 3. All tiles from (29, 29) to (43, 43) to be open
			for (int y = 29; y <= 43; y++) {
				for (int x = 29; x <= 43; x++) {
					Assert::IsTrue(village.tiles[y][x] != Tile::Wall);
				}
			}

			// 4. Exit still at (43, 43) and every open tile reachable
			Assert::IsTrue(village.tiles[43][43] == Tile::Exit);
			Assert::AreEqual(countOpenTiles(village), countReachableTiles(village));
		}
	};
}
