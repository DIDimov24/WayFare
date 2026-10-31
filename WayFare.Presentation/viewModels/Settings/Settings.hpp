#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

namespace WayFare::Presentation {
	class Settings : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Settings) QML_SINGLETON Q_PROPERTY(int sensitivity READ sensitivity NOTIFY sensitivityChanged)

	public:
		explicit Settings(QObject* parent = nullptr);

		int sensitivity() const;

	public slots:
		void setSensitivity(int sensitivity);

	signals:
		void sensitivityChanged();

	private:
		int _sensitivity;
	};
}
