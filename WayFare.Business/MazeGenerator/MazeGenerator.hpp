#pragma once

#include <cstdint>

#include "WayFare.Business/models/Maze.hpp"

namespace WayFare::Business {
	Maze generateMaze(int size, uint32_t seed);

	void carveArena(Maze& maze, int arenaSize);
}
