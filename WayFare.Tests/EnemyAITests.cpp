#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/Enemies/EnemyAI.hpp"
#include "WayFare.Business/Enemies/EnemySpawner.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	Maze createEnemyTestMaze() {
		Maze maze;
		maze.tiles = std::vector<std::vector<Tile>>(9, std::vector<Tile>(9, Tile::Wall));
		maze.tiles[1][1] = Tile::Start;

		for (int x = 2; x <= 7; x++) {
			maze.tiles[1][x] = Tile::Path;
		}

		return maze;
	}

	void runEnemyFrames(std::vector<Enemy>& enemies, Player& player, const Maze& maze, int frames) {
		for (int i = 0; i < frames; i++) {
			updatePlayerHealth(player, 0.1);
			updateEnemies(enemies, player, maze, 0.1);
		}
	}

	int runEnemyFramesUntil(std::vector<Enemy>& enemies, Player& player, const Maze& maze, EnemyState state, int maxFrames) {
		int frames = 0;

		while (frames < maxFrames && enemies[0].state != state) {
			runEnemyFrames(enemies, player, maze, 1);
			frames++;
		}

		return frames;
	}

	TEST_CLASS(EnemyAITests) {
	public:
		// T_009
		TEST_METHOD(ZombieChaseAndAttack) {
			// A 9x9 maze with one corridor in row 1; the player stands at (1.5, 1.5), the zombie 4 tiles away
			Maze maze = createEnemyTestMaze();
			Player player = { 1.5, 1.5, 0.0, maxPlayerHealth, 0.0 };
			std::vector<Enemy> enemies = { createEnemy(EnemyType::Zombie, 5.5, 1.5) };

			// 1. Zombie idle with 3 health
			Assert::IsTrue(enemies[0].state == EnemyState::Idle);
			Assert::AreEqual(3, enemies[0].health);

			// 2. Zombie alerted and standing still
			runEnemyFrames(enemies, player, maze, 1);
			Assert::IsTrue(enemies[0].state == EnemyState::Alerted);
			Assert::AreEqual(5.5, enemies[0].x, 0.001);

			// 3. Still alerted after 2 s, chasing towards the player after 2.5 s
			runEnemyFrames(enemies, player, maze, 20);
			Assert::IsTrue(enemies[0].state == EnemyState::Alerted);
			Assert::AreEqual(5.5, enemies[0].x, 0.001);
			runEnemyFrames(enemies, player, maze, 5);
			Assert::IsTrue(enemies[0].state == EnemyState::Chasing);
			Assert::IsTrue(enemies[0].x < 5.5);

			// 4. Zombie reaches the player and starts its attack, still 8 hearts
			runEnemyFramesUntil(enemies, player, maze, EnemyState::Attacking, 60);
			Assert::IsTrue(enemies[0].state == EnemyState::Attacking);
			Assert::IsTrue(enemies[0].x - player.x <= enemyAttackRange);
			Assert::AreEqual(8, player.health);

			// 5. Player hit after the 0.6 s windup (7 hearts)
			runEnemyFrames(enemies, player, maze, 7);
			Assert::AreEqual(7, player.health);

			// 6. Attack misses, still 7 hearts
			runEnemyFramesUntil(enemies, player, maze, EnemyState::Attacking, 30);
			Assert::IsTrue(enemies[0].state == EnemyState::Attacking);
			player.x = 1.25;
			runEnemyFrames(enemies, player, maze, 7);
			Assert::AreEqual(7, player.health);
		}
	};
}
