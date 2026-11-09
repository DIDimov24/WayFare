#include "WayFare.Presentation/Register/Register.hpp"

#include <QCoreApplication>
#include <QGuiApplication>
#include <QIcon>
#include <QtCore/qtresource.h>
#include <QtQml/qqml.h>

#include "WayFare.Presentation/helpers/Cursor/Cursor.hpp"
#include "WayFare.Presentation/viewModels/Assets/Assets.hpp"
#include "WayFare.Presentation/viewModels/Game/Game.hpp"
#include "WayFare.Presentation/viewModels/Level/Level.hpp"
#include "WayFare.Presentation/viewModels/MainMenu/MainMenu.hpp"
#include "WayFare.Presentation/viewModels/Settings/Settings.hpp"

// Q_INIT_RESOURCE cannot be used within a namespace
void initializeResources() {
	Q_INIT_RESOURCE(presentation);
}

namespace WayFare::Presentation {
	void initialize() {
		initializeResources();

		QCoreApplication* app = QCoreApplication::instance();
		Settings* settings = new Settings(app);
		Game* game = new Game(app);
		Level* level = new Level(*settings, app);
		Assets* assets = new Assets(app);

		QGuiApplication::setWindowIcon(QIcon(assets->url().toLocalFile() + QStringLiteral("logo/wayfare-logo.svg")));

		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Assets", assets);
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Cursor", new Cursor(app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Game", game);
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Level", level);
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "MainMenu", new MainMenu(*game, *level, app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Settings", settings);
	}
}
