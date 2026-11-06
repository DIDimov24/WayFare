#pragma once

#include <string>

namespace WayFare::Business {
	enum class AttackStatus {
		Success,
		Failure,
		NoWeapon,
		Cooldown,
		Miss,
		Killed
	};

	struct Combat {
		double swordCooldown;
		double pistolCooldown;
	};

	struct AttackResponse {
		bool success;
		std::string errorMessage;
		AttackStatus status;
		int hitCount;
		int killCount;
		double distance;
	};
}
