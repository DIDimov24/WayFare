#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "WayFare.Business/Game/GameService.hpp"
#include "WayFare.DataAccess/Database/Database.hpp"
#include "WayFare.DataAccess/SaveRepository/SaveRepository.hpp"
#include "WayFare.DataAccess/SettingsRepository/SettingsRepository.hpp"
#include "WayFare.Presentation/Register/Register.hpp"

int main(int argc, char* argv[]) {
	QGuiApplication app(argc, argv);
	QGuiApplication::setApplicationName(QStringLiteral("WayFare"));

	WayFare::DataAccess::Database database;
	WayFare::DataAccess::SaveRepository saves(database);
	WayFare::DataAccess::SettingsRepository settings(database);
	WayFare::Business::GameService gameService(saves, settings);
	WayFare::Presentation::initialize(gameService);

	QQmlApplicationEngine engine;
	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed,
		&app, []() { QCoreApplication::exit(-1); },
		Qt::QueuedConnection);
	engine.loadFromModule("wayfare", "Main");

	return app.exec();
}
