#include "WayFare.Presentation/Module.hpp"

#include <QCoreApplication>
#include <QtCore/qtresource.h>
#include <QtQml/qqml.h>

#include "WayFare.Presentation/viewModels/Assets.hpp"
#include "WayFare.Presentation/viewModels/MainMenu.hpp"

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
	}
}
