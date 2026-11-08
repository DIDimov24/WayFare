#include "WayFare.Presentation/Register/Register.hpp"

#include <QCoreApplication>
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
	void initialize(Business::GameService& gameService) {
		initializeResources();

		QCoreApplication* app = QCoreApplication::instance();
		Settings* settings = new Settings(gameService, app);
		Game* game = new Game(app);
		Level* level = new Level(*settings, *game, gameService, app);

		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Assets", new Assets(app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Cursor", new Cursor(app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Game", game);
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Level", level);
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "MainMenu", new MainMenu(*game, *level, gameService, app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Settings", settings);
	}
}
