#include "WayFare.Presentation/viewModels/HomeViewModel.hpp"

namespace WayFare::Presentation {
	HomeViewModel::HomeViewModel(QObject* parent) : QObject(parent) {
		_greeting = QStringLiteral("Hello World!");
	}

	QString HomeViewModel::greeting() const {
		return _greeting;
	}

	void HomeViewModel::setGreeting(const QString& greeting) {
		if (_greeting == greeting) {
			return;
		}

		_greeting = greeting;
		emit greetingChanged();
	}
}
