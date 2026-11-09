#include "CppUnitTest.h"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	TEST_CLASS(HealthTests) {
	public:
		// T_004
		TEST_METHOD(DamageAndDeath) {
			Player player = { 1.5, 1.5, 0.0, maxPlayerHealth, 0.0 };

			// 1. 8 hearts, not invincible
			Assert::AreEqual(8, player.health);
			Assert::IsFalse(isPlayerInvincible(player));

			// 2. 7 hearts, invincible
			Assert::IsTrue(damagePlayer(player, 1) == DamageStatus::Success);
			Assert::AreEqual(7, player.health);
			Assert::IsTrue(isPlayerInvincible(player));

			// 3. Hit ignored, still 7 hearts
			Assert::IsTrue(damagePlayer(player, 1) == DamageStatus::Invincible);
			Assert::AreEqual(7, player.health);

			// 4. Still invincible after 0.5 s, not after 1 s
			updatePlayerHealth(player, 0.5);
			Assert::IsTrue(isPlayerInvincible(player));
			updatePlayerHealth(player, 0.5);
			Assert::IsFalse(isPlayerInvincible(player));

			// 5. Rejected, still 7 hearts
			Assert::IsTrue(damagePlayer(player, 0) == DamageStatus::Failure);
			Assert::IsTrue(damagePlayer(player, -3) == DamageStatus::Failure);
			Assert::AreEqual(7, player.health);

			// 6. Player dies with 0 hearts (not negative)
			Assert::IsTrue(damagePlayer(player, 10) == DamageStatus::Died);
			Assert::AreEqual(0, player.health);
			Assert::IsTrue(isPlayerDead(player));

			// 7. Rejected, still 0 hearts
			Assert::IsTrue(damagePlayer(player, 1) == DamageStatus::Failure);
			Assert::AreEqual(0, player.health);
		}
	};
}
