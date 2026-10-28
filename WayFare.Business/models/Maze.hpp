#pragma once

#include <vector>

namespace WayFare::Business {
	enum class Tile {
		Wall,
		Path,
		Start,
		Exit
	};

	struct Maze {
		std::vector<std::vector<Tile>> tiles;
	};
}
