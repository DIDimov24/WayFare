#include "CppUnitTest.h"
#include <vector>
#include "WayFare.Business/Boss/BossFight.hpp"
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	int runBossFramesWhile(Boss& boss, Player& player, const Maze& maze, BossState state, int maxFrames) {
		int frames = 0;

		while (frames < maxFrames && boss.state == state) {
			updatePlayerHealth(player, 0.1);
			updateBoss(boss, player, maze, 0.1);
			frames++;
		}

		return frames;
	}

	int countDormantMinions(const std::vector<Enemy>& minions) {
		int count = 0;

		for (size_t i = 0; i < minions.size(); i++) {
			if (minions[i].state == EnemyState::Dormant) {
				count++;
			}
		}

		return count;
	}

	TEST_CLASS(BossTests) {
	public:
		// T_011
		TEST_METHOD(BossPhases) {
			// The 45x45 village maze with the 15x15 arena from (29, 29) to (43, 43)
			Maze maze = generateMaze(45, 7);
			carveArena(maze, 15);
			Boss boss = createBoss(maze, 15);
			Player player = { 31.5, 31.5, 0.0, maxPlayerHealth, 0.0 };
			std::vector<Enemy> minions = createBossMinions(boss);

			// 1. 75 health, phase 1, waiting in the arena centre (36.5, 36.5)
			Assert::AreEqual(75, boss.health);
			Assert::AreEqual(1, boss.phase);
			Assert::IsTrue(boss.state == BossState::Waiting);
			Assert::AreEqual(36.5, boss.x, 0.001);
			Assert::AreEqual(36.5, boss.y, 0.001);

			// 2. Hit ignored, still 75 health
			Assert::IsTrue(damageBoss(boss, 2) == BossHitStatus::Invulnerable);
			Assert::AreEqual(75, boss.health);

			// 3. Intro starts, the arena is locked
			BossUpdateResponse response = updateBoss(boss, player, maze, 0.1);
			Assert::IsTrue(response.started);
			Assert::IsTrue(boss.state == BossState::Intro);
			Assert::IsTrue(isBossCutscenePlaying(boss));
			Assert::IsTrue(isArenaLocked(boss));

			// 4. Intro lasts 4.5 s, then the troll chases the player
			int frames = runBossFramesWhile(boss, player, maze, BossState::Intro, 60);
			Assert::IsTrue(frames >= 45);
			Assert::IsTrue(boss.state == BossState::Chasing);
			Assert::IsFalse(isBossCutscenePlaying(boss));

			// 5. Still phase 1 at 51 health, phase 2 and roar at 50 health
			Assert::IsTrue(damageBoss(boss, 24) == BossHitStatus::Success);
			Assert::AreEqual(1, boss.phase);
			Assert::IsTrue(damageBoss(boss, 1) == BossHitStatus::PhaseChanged);
			Assert::AreEqual(2, boss.phase);
			Assert::IsTrue(boss.state == BossState::Roaring);

			// 6. Hit ignored during the roar, still 50 health
			Assert::IsTrue(damageBoss(boss, 2) == BossHitStatus::Invulnerable);
			Assert::AreEqual(50, boss.health);

			// 7. 2 creatures summoned, 3 stay dormant
			Assert::AreEqual(2, summonBossMinions(minions, boss));
			Assert::AreEqual(3, countDormantMinions(minions));

			// 8. Phase 3 and roar at 25 health, 3 more creatures summoned
			runBossFramesWhile(boss, player, maze, BossState::Roaring, 30);
			Assert::IsTrue(damageBoss(boss, 25) == BossHitStatus::PhaseChanged);
			Assert::AreEqual(3, boss.phase);
			Assert::AreEqual(3, summonBossMinions(minions, boss));
			Assert::AreEqual(0, countDormantMinions(minions));

			// 9. Troll killed (0 health), death cutscene plays, further hits rejected
			runBossFramesWhile(boss, player, maze, BossState::Roaring, 30);
			Assert::IsTrue(damageBoss(boss, 100) == BossHitStatus::Killed);
			Assert::AreEqual(0, boss.health);
			Assert::IsTrue(boss.state == BossState::Dead);
			Assert::IsTrue(isBossCutscenePlaying(boss));
			Assert::IsTrue(damageBoss(boss, 1) == BossHitStatus::Failure);

			// 10. Cutscene ends after 3 s, the arena unlocks
			bool defeated = false;
			for (int i = 0; i < 31; i++) {
				if (updateBoss(boss, player, maze, 0.1).defeated) {
					defeated = true;
				}
			}
			Assert::IsTrue(defeated);
			Assert::IsFalse(isBossCutscenePlaying(boss));
			Assert::IsFalse(isArenaLocked(boss));
		}
	};
}
