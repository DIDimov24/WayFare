#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

namespace WayFare::Presentation {
	class MainMenu : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(MainMenu) QML_SINGLETON Q_PROPERTY(bool hasSave READ hasSave NOTIFY hasSaveChanged)

	public:
		explicit MainMenu(QObject* parent = nullptr);

		bool hasSave() const;

	public slots:
		void newGame();
		void resume();
		void quit();

	signals:
		void hasSaveChanged();

	private:
		bool _hasSave;
	};
}
