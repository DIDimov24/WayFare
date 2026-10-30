#pragma once

namespace WayFare::Business {
	enum class DamageStatus {
		Success,
		Failure,
		Invincible,
		Died
	};

	struct Player {
		double x;
		double y;
		double facing;
		int health;
		double invincibilityTime;
	};
}
