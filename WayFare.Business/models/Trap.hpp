#pragma once

#include <string>

namespace WayFare::Business {
	enum class TrapState {
		Hidden,
		Rising,
		Up,
		Lowering
	};

	struct SpikeTrap {
		int x;
		int y;
		double timer;
	};

	struct TrapUpdateResponse {
		bool success;
		std::string errorMessage;
		bool playerHit;
		bool playerDied;
	};
}
