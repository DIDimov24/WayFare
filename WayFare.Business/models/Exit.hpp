#pragma once

namespace WayFare::Business {
	enum class ExitStatus {
		Success,
		Failure,
		NotOnExit,
		Locked
	};
}
