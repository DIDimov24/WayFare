#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "WayFare.Presentation/Register/Register.hpp"

int main(int argc, char* argv[]) {
	QGuiApplication app(argc, argv);
	QGuiApplication::setApplicationName(QStringLiteral("WayFare"));

	WayFare::Presentation::initialize();

	QQmlApplicationEngine engine;
	QObject::connect(
		&engine, &QQmlApplicationEngine::objectCreationFailed,
		&app, []() { QCoreApplication::exit(-1); },
		Qt::QueuedConnection);
	engine.loadFromModule("wayfare", "Main");

	return app.exec();
}
