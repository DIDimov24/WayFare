#include "WayFare.Presentation/Module.hpp"

#include <QtCore/qtresource.h>
#include <QtQml/qqml.h>

#include "WayFare.Presentation/viewModels/HomeViewModel.hpp"

// Q_INIT_RESOURCE cannot be used within a namespace
void initializeResources() {
	Q_INIT_RESOURCE(presentation);
}

namespace WayFare::Presentation {
	void initialize() {
		initializeResources();

		qmlRegisterType<HomeViewModel>(QmlModuleUri, 1, 0, "HomeViewModel");
	}
}
