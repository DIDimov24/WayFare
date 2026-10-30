#include <vector>
#include <cmath>
#include <WayFare.Business/models/Maze.hpp>
#include <WayFare.Business/models/Player.hpp>
#include <WayFare.Business/Player/PlayerHealth.hpp>

namespace WayFare::Business {
	const double playerRadius = 0.25;
	const double playerSpeed = 2.0;
	const double playerTurnSpeed = 0.003;
	const double maxDeltaTime = 0.1;
	const double twoPi = 6.2831853;

	bool isMazeWallAt(const Maze& maze, int x, int y) {
		int size = int(maze.tiles.size());

		if (x < 0 || y < 0 || x >= size || y >= size) {
			return true;
		}

		return maze.tiles[y][x] == Tile::Wall;
	}

	bool isPlayerBlocked(const Maze& maze, double x, double y) {
		int left = int(std::floor(x - playerRadius));
		int right = int(std::floor(x + playerRadius));
		int top = int(std::floor(y - playerRadius));
		int bottom = int(std::floor(y + playerRadius));

		for (int tileY = top; tileY <= bottom; tileY++) {
			for (int tileX = left; tileX <= right; tileX++) {
				if (isMazeWallAt(maze, tileX, tileY)) {
					return true;
				}
			}
		}

		return false;
	}

	Player createPlayer(const Maze& maze) {
		Player player = { 0.0, 0.0, 0.0, maxPlayerHealth, 0.0 };

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] == Tile::Start) {
					player.x = double(x) + 0.5;
					player.y = double(y) + 0.5;

					if (isMazeWallAt(maze, int(x) + 1, int(y))) {
						player.facing = twoPi / 4;
					}
				}
			}
		}

		return player;
	}

	void movePlayer(Player& player, const Maze& maze, double forward, double strafe, double deltaTime) {
		if (deltaTime > maxDeltaTime) {
			deltaTime = maxDeltaTime;
		}

		double length = std::sqrt(forward * forward + strafe * strafe);
		if (length > 1.0) {
			forward = forward / length;
			strafe = strafe / length;
		}

		double forwardX = std::cos(player.facing);
		double forwardY = std::sin(player.facing);
		double rightX = -forwardY;
		double rightY = forwardX;

		double stepX = (forwardX * forward + rightX * strafe) * playerSpeed * deltaTime;
		double stepY = (forwardY * forward + rightY * strafe) * playerSpeed * deltaTime;

		if (!isPlayerBlocked(maze, player.x + stepX, player.y)) {
			player.x = player.x + stepX;
		}

		if (!isPlayerBlocked(maze, player.x, player.y + stepY)) {
			player.y = player.y + stepY;
		}
	}

	void turnPlayer(Player& player, double mouseDeltaX, double sensitivity) {
		player.facing = player.facing + mouseDeltaX * sensitivity * playerTurnSpeed;

		player.facing = std::fmod(player.facing, twoPi);
		if (player.facing < 0.0) {
			player.facing = player.facing + twoPi;
		}
	}

	bool isPlayerOnExit(const Player& player, const Maze& maze) {
		return maze.tiles[int(player.y)][int(player.x)] == Tile::Exit;
	}
}
