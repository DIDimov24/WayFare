#include "WayFare.Presentation/viewModels/MainMenu/MainMenu.hpp"

#include <QCoreApplication>

namespace WayFare::Presentation {
	MainMenu::MainMenu(QObject* parent) : QObject(parent) {
		// resume stays disabled until DAL implementation
		_hasSave = false;
	}

	bool MainMenu::hasSave() const {
		return _hasSave;
	}

	void MainMenu::newGame() {
	}

	void MainMenu::resume() {
	}

	void MainMenu::quit() {
		QCoreApplication::quit();
	}
}
