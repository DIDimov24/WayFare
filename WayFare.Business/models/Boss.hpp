#pragma once

#include <string>

namespace WayFare::Business {
	enum class BossState {
		Waiting,
		Intro,
		Roaring,
		Chasing,
		Swiping,
		Slamming,
		Charging,
		Recovering,
		Dead
	};

	enum class BossHitStatus {
		Success,
		Failure,
		Miss,
		Invulnerable,
		PhaseChanged,
		Killed
	};

	struct Boss {
		double x;
		double y;
		double facing;
		int health;
		int phase;
		BossState state;
		double stateTime;
		double cooldown;
		double hurtTime;
		double chargeX;
		double chargeY;
		bool attackLanded;
		int attackCount;
		int arenaFirst;
		int arenaLast;
	};

	struct BossUpdateResponse {
		bool success;
		std::string errorMessage;
		bool started;
		bool playerHit;
		bool slammed;
		bool defeated;
	};
}
