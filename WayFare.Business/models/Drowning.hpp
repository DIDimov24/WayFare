#pragma once

namespace WayFare::Business {
	enum class DrowningStatus {
		Success,
		Failure,
		Protected,
		Drowning,
		Died
	};

	struct Drowning {
		double air;
		double damageTimer;
	};
}
