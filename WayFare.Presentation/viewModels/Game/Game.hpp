#pragma once

#include <QObject>
#include <QString>
#include <QtQml/qqmlregistration.h>

namespace WayFare::Presentation {
	class Game : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Game) QML_SINGLETON Q_PROPERTY(QString phase READ phase NOTIFY phaseChanged)

	public:
		explicit Game(QObject* parent = nullptr);

		QString phase() const;
		void setPhase(const QString& phase);

	signals:
		void phaseChanged();

	private:
		QString _phase;
	};
}
