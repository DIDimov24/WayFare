#include "CppUnitTest.h"
#include "WayFare.Business/Hazards/Drowning.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace WayFare::Business;

namespace WayFare::Tests {
	DrowningStatus swimForSeconds(Drowning& drowning, Player& player, const Inventory& inventory, int seconds) {
		DrowningStatus status = DrowningStatus::Success;

		for (int i = 0; i < seconds; i++) {
			updatePlayerHealth(player, 1.0);
			status = updateDrowning(drowning, player, inventory, 1.0);
		}

		return status;
	}

	TEST_CLASS(DrowningTests) {
	public:
		// T_007
		TEST_METHOD(DrowningAndDivingGear) {
			Drowning drowning = createDrowning();
			Player player = { 1.5, 1.5, 0.0, maxPlayerHealth, 0.0 };
			Inventory inventory = createInventory();

			// 1. Air meter full (45 s)
			Assert::AreEqual(45.0, drowning.air, 0.001);

			// 2. 1 s of air left, still 8 hearts
			Assert::IsTrue(swimForSeconds(drowning, player, inventory, 44) == DrowningStatus::Success);
			Assert::AreEqual(1.0, drowning.air, 0.001);
			Assert::AreEqual(8, player.health);

			// 3. Air at 0, 1 heart lost (7 hearts)
			Assert::IsTrue(swimForSeconds(drowning, player, inventory, 3) == DrowningStatus::Drowning);
			Assert::AreEqual(0.0, drowning.air, 0.001);
			Assert::AreEqual(7, player.health);

			// 4. 1 heart lost every 3 s until the player drowns (0 hearts)
			Assert::IsTrue(swimForSeconds(drowning, player, inventory, 21) == DrowningStatus::Died);
			Assert::AreEqual(0, player.health);

			// 5. Nothing happens
			Assert::IsTrue(updateDrowning(drowning, player, inventory, 1.0) == DrowningStatus::Failure);

			// 6. Air refilled from 15 to 45, no hearts lost
			Drowning diverAir = createDrowning();
			Player diver = { 1.5, 1.5, 0.0, maxPlayerHealth, 0.0 };
			swimForSeconds(diverAir, diver, inventory, 30);
			Assert::AreEqual(15.0, diverAir.air, 0.001);

			addItem(inventory, ItemType::DivingGear);
			Assert::IsTrue(swimForSeconds(diverAir, diver, inventory, 100) == DrowningStatus::Protected);
			Assert::AreEqual(45.0, diverAir.air, 0.001);
			Assert::AreEqual(8, diver.health);
		}
	};
}
