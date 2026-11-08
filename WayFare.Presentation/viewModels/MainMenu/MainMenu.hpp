#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include "WayFare.Business/Game/GameService.hpp"
#include "WayFare.Presentation/viewModels/Game/Game.hpp"
#include "WayFare.Presentation/viewModels/Level/Level.hpp"

namespace WayFare::Presentation {
	class MainMenu : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(MainMenu) QML_SINGLETON Q_PROPERTY(bool hasSave READ hasSave NOTIFY hasSaveChanged)

	public:
		explicit MainMenu(Game& game, Level& level, Business::GameService& gameService, QObject* parent = nullptr);

		bool hasSave() const;

	public slots:
		void newGame();
		void resume();
		void quit();

	signals:
		void hasSaveChanged();

	private:
		void updateHasSave();

		Game& _game;
		Level& _level;
		Business::GameService& _gameService;
		bool _hasSave;
	};
}
