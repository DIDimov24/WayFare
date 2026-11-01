#include "WayFare.Presentation/viewModels/Game/Game.hpp"

namespace WayFare::Presentation {
	Game::Game(QObject* parent) : QObject(parent) {
		_phase = QStringLiteral("menu");
	}

	QString Game::phase() const {
		return _phase;
	}

	void Game::setPhase(const QString& phase) {
		if (phase == _phase) {
			return;
		}
		_phase = phase;
		emit phaseChanged();
	}

	void Game::startLevel() {
		setPhase(QStringLiteral("level"));
	}
}
