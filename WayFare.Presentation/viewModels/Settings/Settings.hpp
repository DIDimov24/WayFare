#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

namespace WayFare::Presentation {
	class Settings : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Settings) QML_SINGLETON Q_PROPERTY(int sensitivity READ sensitivity NOTIFY sensitivityChanged) Q_PROPERTY(int musicVolume READ musicVolume NOTIFY musicVolumeChanged) Q_PROPERTY(int sfxVolume READ sfxVolume NOTIFY sfxVolumeChanged)

	public:
		explicit Settings(QObject* parent = nullptr);

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
		int _sensitivity;
		int _musicVolume;
		int _sfxVolume;
	};
}
