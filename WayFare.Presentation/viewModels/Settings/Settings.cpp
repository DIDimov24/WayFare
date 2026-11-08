#include "WayFare.Presentation/viewModels/Settings/Settings.hpp"

#include <QCoreApplication>
#include <QDebug>

namespace WayFare::Presentation {
	const int settingsSaveDelay = 400;

	Settings::Settings(Business::GameService& gameService, QObject* parent) : QObject(parent), _gameService(gameService) {
		Business::GameSettings settings = _gameService.loadSettings();
		_sensitivity = settings.sensitivity;
		_musicVolume = settings.musicVolume;
		_sfxVolume = settings.sfxVolume;

		_saveTimer.setSingleShot(true);
		_saveTimer.setInterval(settingsSaveDelay);
		connect(&_saveTimer, &QTimer::timeout, this, &Settings::save);
		connect(QCoreApplication::instance(), &QCoreApplication::aboutToQuit, this, &Settings::savePending);
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
		_saveTimer.start();
	}

	void Settings::setMusicVolume(int volume) {
		if (volume == _musicVolume) {
			return;
		}
		_musicVolume = volume;
		emit musicVolumeChanged();
		_saveTimer.start();
	}

	void Settings::setSfxVolume(int volume) {
		if (volume == _sfxVolume) {
			return;
		}
		_sfxVolume = volume;
		emit sfxVolumeChanged();
		_saveTimer.start();
	}

	void Settings::save() {
		Business::GameSettings settings = { _sensitivity, _musicVolume, _sfxVolume };
		if (_gameService.saveSettings(settings) != Business::SaveSettingsStatus::Success) {
			qWarning() << "Could not save the settings";
		}
	}

	void Settings::savePending() {
		if (!_saveTimer.isActive()) {
			return;
		}
		_saveTimer.stop();
		save();
	}
}
