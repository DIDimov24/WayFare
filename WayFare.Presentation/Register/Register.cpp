#include "WayFare.Presentation/Register/Register.hpp"

#include <QCoreApplication>
#include <QtCore/qtresource.h>
#include <QtQml/qqml.h>

#include "WayFare.Presentation/viewModels/Assets/Assets.hpp"
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
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Assets", new Assets(app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "MainMenu", new MainMenu(app));
		qmlRegisterSingletonInstance(QmlModuleUri, 1, 0, "Settings", new Settings(app));
	}
}
