#include "WayFare.Presentation/viewModels/Game/Game.hpp"

#include <QCoreApplication>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QStandardPaths>

namespace WayFare::Presentation {
	const int warmUpVersion = 1;

	QString gameWarmUpMarker() {
		QString folder = QStandardPaths::writableLocation(QStandardPaths::CacheLocation);
		return folder + QStringLiteral("/warmup-") + QString::number(warmUpVersion);
	}

	Game::Game(QObject* parent) : QObject(parent) {
		_phase = QStringLiteral("menu");
		if (!QFile::exists(gameWarmUpMarker())) {
			_phase = QStringLiteral("warmup");
		}
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

	void Game::finishWarmUp() {
		if (_phase != QStringLiteral("warmup")) {
			return;
		}
		connect(QCoreApplication::instance(), &QCoreApplication::aboutToQuit, this, []() {
			QString marker = gameWarmUpMarker();
			QDir().mkpath(QFileInfo(marker).absolutePath());
			QFile file(marker);
			if (file.open(QIODevice::WriteOnly)) {
				file.close();
			}
		});
		setPhase(QStringLiteral("menu"));
	}
}
