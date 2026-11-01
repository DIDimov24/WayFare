#include "WayFare.Presentation/viewModels/MainMenu/MainMenu.hpp"

#include <QCoreApplication>
#include <QRandomGenerator>

namespace WayFare::Presentation {
	MainMenu::MainMenu(Game& game, Level& level, QObject* parent) : QObject(parent), _game(game), _level(level) {
		// resume stays disabled until DAL implementation
		_hasSave = false;
	}

	bool MainMenu::hasSave() const {
		return _hasSave;
	}

	void MainMenu::newGame() {
		_level.load(1, QRandomGenerator::global()->generate());
		_game.setPhase(QStringLiteral("intro"));
	}

	void MainMenu::resume() {
	}

	void MainMenu::quit() {
		QCoreApplication::quit();
	}
}
