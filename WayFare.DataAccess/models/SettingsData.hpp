#pragma once

#include <string>

namespace WayFare::DataAccess {
	enum class SettingsStatus {
		Success,
		Failure
	};

	struct SettingsData {
		int sensitivity;
		int musicVolume;
		int sfxVolume;
	};

	struct LoadSettingsResponse {
		bool success;
		std::string errorMessage;
		SettingsData settings;
	};
}
