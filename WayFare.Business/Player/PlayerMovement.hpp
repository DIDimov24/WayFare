#pragma once

#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	Player createPlayer(const Maze& maze);

	void movePlayer(Player& player, const Maze& maze, double forward, double strafe, double deltaTime);

	void turnPlayer(Player& player, double mouseDeltaX, double sensitivity);

	bool isPlayerOnExit(const Player& player, const Maze& maze);
}
