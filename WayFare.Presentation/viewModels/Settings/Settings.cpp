#include "WayFare.Presentation/viewModels/Settings/Settings.hpp"

namespace WayFare::Presentation {
	Settings::Settings(QObject* parent) : QObject(parent) {
		// in memory until DAL implementation
		_sensitivity = 25;
		_musicVolume = 100;
		_sfxVolume = 100;
	}

	int Settings::sensitivity() const {
		return _sensitivity;
	}

	int Settings::musicVolume() const {
		return _musicVolume;
	}

	int Settings::sfxVolume() const {
		return _sfxVolume;
	}

	void Settings::setSensitivity(int sensitivity) {
		if (sensitivity == _sensitivity) {
			return;
		}
		_sensitivity = sensitivity;
		emit sensitivityChanged();
	}

	void Settings::setMusicVolume(int volume) {
		if (volume == _musicVolume) {
			return;
		}
		_musicVolume = volume;
		emit musicVolumeChanged();
	}

	void Settings::setSfxVolume(int volume) {
		if (volume == _sfxVolume) {
			return;
		}
		_sfxVolume = volume;
		emit sfxVolumeChanged();
	}
}
