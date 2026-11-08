#pragma once

#include <QObject>
#include <QTimer>
#include <QtQml/qqmlregistration.h>

#include "WayFare.Business/Game/GameService.hpp"

namespace WayFare::Presentation {
	class Settings : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Settings) QML_SINGLETON Q_PROPERTY(int sensitivity READ sensitivity NOTIFY sensitivityChanged) Q_PROPERTY(int musicVolume READ musicVolume NOTIFY musicVolumeChanged) Q_PROPERTY(int sfxVolume READ sfxVolume NOTIFY sfxVolumeChanged)

	public:
		Settings(Business::GameService& gameService, QObject* parent = nullptr);

		int sensitivity() const;
		int musicVolume() const;
		int sfxVolume() const;

	public slots:
		void setSensitivity(int sensitivity);
		void setMusicVolume(int volume);
		void setSfxVolume(int volume);

	signals:
		void sensitivityChanged();
		void musicVolumeChanged();
		void sfxVolumeChanged();

	private:
		void save();
		void savePending();

		Business::GameService& _gameService;
		QTimer _saveTimer;
		int _sensitivity;
		int _musicVolume;
		int _sfxVolume;
	};
}
