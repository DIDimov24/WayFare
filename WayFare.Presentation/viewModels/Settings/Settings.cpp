#include "WayFare.Presentation/viewModels/Settings/Settings.hpp"

namespace WayFare::Presentation {
	Settings::Settings(QObject* parent) : QObject(parent) {
		// in memory until DAL implementation
		_sensitivity = 50;
	}

	int Settings::sensitivity() const {
		return _sensitivity;
	}

	void Settings::setSensitivity(int sensitivity) {
		if (sensitivity == _sensitivity) {
			return;
		}
		_sensitivity = sensitivity;
		emit sensitivityChanged();
	}
}
