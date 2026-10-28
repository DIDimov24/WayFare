#include <cstdint>
#include <WayFare.Business/models/Maze.hpp>
#include <random>
#include <vector>

namespace WayFare::Business {
	struct MazeCell {
		int x;
		int y;
	};

	bool isMazeRoomUncarved(const Maze& maze, int x, int y) {
		int last = int(maze.tiles.size()) - 2;

		if (x < 1 || y < 1 || x > last || y > last) {
			return false;
		}

		return maze.tiles[y][x] == Tile::Wall;
	}

	Maze generateMaze(int size, uint32_t seed) {
		Maze maze;

		maze.tiles = std::vector<std::vector<Tile>>(size, std::vector<Tile>(size, Tile::Wall));

		std::mt19937 rng(seed);
		std::vector<MazeCell> stack;

		stack.push_back({ 1, 1 });

		maze.tiles[1][1] = Tile::Path;

		while (!stack.empty()) {
			MazeCell current = stack[stack.size() - 1];

			std::vector<MazeCell> neighbours;
			if (isMazeRoomUncarved(maze, current.x, current.y - 2)) {
				neighbours.push_back({ current.x, current.y - 2 });
			}
			if (isMazeRoomUncarved(maze, current.x, current.y + 2)) {
				neighbours.push_back({ current.x, current.y + 2 });
			}
			if (isMazeRoomUncarved(maze, current.x + 2, current.y)) {
				neighbours.push_back({ current.x + 2, current.y });
			}
			if (isMazeRoomUncarved(maze, current.x - 2, current.y)) {
				neighbours.push_back({ current.x - 2, current.y });
			}

			if (neighbours.empty()) {
				stack.pop_back();
			} else {
				MazeCell next = neighbours[rng() % neighbours.size()];

				int wallX = (current.x + next.x) / 2;
				int wallY = (current.y + next.y) / 2;
				maze.tiles[wallY][wallX] = Tile::Path;
				maze.tiles[next.y][next.x] = Tile::Path;
				stack.push_back(next);
			}
		}

		maze.tiles[1][1] = Tile::Start;
		maze.tiles[size - 2][size - 2] = Tile::Exit;

		return maze;
	}

	void carveArena(Maze& maze, int arenaSize) {
		int first = int(maze.tiles.size()) - 1 - arenaSize;
		int last = int(maze.tiles.size()) - 2;

		for (int y = first; y <= last; y++) {
			for (int x = first; x <= last; x++) {
				if (maze.tiles[y][x] == Tile::Wall) {
					maze.tiles[y][x] = Tile::Path;
				}
			}
		}
	}
}
