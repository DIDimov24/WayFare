#pragma once

#include <string>

namespace WayFare::Business {
	enum class EnemyType {
		Zombie,
		NightmareCreature
	};

	enum class EnemyState {
		Idle,
		Chasing,
		Attacking,
		Dead
	};

	struct Enemy {
		EnemyType type;
		double x;
		double y;
		double facing;
		int health;
		EnemyState state;
		double attackTimer;
		double cooldown;
		double hurtTime;
	};

	struct EnemyUpdateResponse {
		bool success;
		std::string errorMessage;
		bool playerHit;
		bool playerDied;
	};
}
