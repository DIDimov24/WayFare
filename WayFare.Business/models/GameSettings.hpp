#pragma once

namespace WayFare::Business {
	enum class SaveSettingsStatus {
		Success,
		Failure
	};

	struct GameSettings {
		int sensitivity;
		int musicVolume;
		int sfxVolume;
	};
}
