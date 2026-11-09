#include "WayFare.Presentation/viewModels/MainMenu/MainMenu.hpp"

#include <QCoreApplication>
#include <QDebug>
#include <QRandomGenerator>

namespace WayFare::Presentation {
	MainMenu::MainMenu(Game& game, Level& level, Business::GameService& gameService, QObject* parent) : QObject(parent), _game(game), _level(level), _gameService(gameService) {
		_hasSave = _gameService.hasSave();
		connect(&_game, &Game::phaseChanged, this, &MainMenu::updateHasSave);
	}

	bool MainMenu::hasSave() const {
		return _hasSave;
	}

	void MainMenu::newGame() {
		_level.load(1, QRandomGenerator::global()->generate());
		_level.save();
		_game.setPhase(QStringLiteral("intro"));
	}

	void MainMenu::resume() {
		Business::LoadGameResponse response = _gameService.loadGame();
		if (!response.success) {
			qWarning() << "Could not resume:" << QString::fromStdString(response.errorMessage);
			updateHasSave();
			return;
		}

		_level.restore(response.game);
		_game.setPhase(QStringLiteral("level"));
	}

	void MainMenu::quit() {
		QCoreApplication::quit();
	}

	void MainMenu::updateHasSave() {
		bool hasSave = _gameService.hasSave();
		if (hasSave == _hasSave) {
			return;
		}
		_hasSave = hasSave;
		emit hasSaveChanged();
	}
}
