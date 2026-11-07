#include <cstdint>
#include <cstdlib>
#include <random>
#include <vector>
#include "WayFare.Business/Enemies/EnemySpawner.hpp"

namespace WayFare::Business {
	struct EnemySpawnTile {
		int x;
		int y;
	};

	Enemy createEnemy(EnemyType type, double x, double y) {
		int health = zombieMaxHealth;

		if (type == EnemyType::NightmareCreature) {
			health = nightmareCreatureMaxHealth;
		}

		Enemy enemy = { type, x, y, 0.0, health, EnemyState::Idle, 0.0, 0.0, 0.0, 0.0, false };
		return enemy;
	}

	std::vector<Enemy> spawnEnemies(const Maze& maze, uint32_t seed, EnemyType type, int count, int arenaSize) {
		int size = int(maze.tiles.size());
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

		int arenaFirst = size;
		if (arenaSize > 0) {
			arenaFirst = size - 1 - arenaSize;
		}

		std::vector<EnemySpawnTile> freeTiles;

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] != Tile::Path) {
					continue;
				}

				int distance = std::abs(int(x) - startX) + std::abs(int(y) - startY);
				if (distance < enemyMinStartDistance) {
					continue;
				}

				if (int(x) >= arenaFirst && int(y) >= arenaFirst) {
					continue;
				}

				freeTiles.push_back({ int(x), int(y) });
			}
		}

		std::mt19937 rng(seed ^ 0x5eed0001u);
		std::vector<Enemy> enemies;

		for (int i = 0; i < count && !freeTiles.empty(); i++) {
			size_t index = rng() % freeTiles.size();
			EnemySpawnTile tile = freeTiles[index];

			freeTiles[index] = freeTiles[freeTiles.size() - 1];
			freeTiles.pop_back();

			Enemy enemy = createEnemy(type, double(tile.x) + 0.5, double(tile.y) + 0.5);
			enemy.facing = double(rng() % 4) * 1.5707963;
			enemies.push_back(enemy);
		}

		return enemies;
	}
}
