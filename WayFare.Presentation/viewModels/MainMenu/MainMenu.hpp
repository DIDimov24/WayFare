#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include "WayFare.Presentation/viewModels/Game/Game.hpp"
#include "WayFare.Presentation/viewModels/Level/Level.hpp"

namespace WayFare::Presentation {
	class MainMenu : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(MainMenu) QML_SINGLETON Q_PROPERTY(bool hasSave READ hasSave NOTIFY hasSaveChanged)

	public:
		explicit MainMenu(Game& game, Level& level, QObject* parent = nullptr);

		bool hasSave() const;

	public slots:
		void newGame();
		void resume();
		void quit();

	signals:
		void hasSaveChanged();

	private:
		Game& _game;
		Level& _level;
		bool _hasSave;
	};
}
