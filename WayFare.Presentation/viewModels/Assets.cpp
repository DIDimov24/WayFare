#include "WayFare.Presentation/viewModels/Assets.hpp"

#include <QCoreApplication>
#include <QFile>

namespace WayFare::Presentation {
	Assets::Assets(QObject* parent) : QObject(parent) {
		_directory = QCoreApplication::applicationDirPath() + QStringLiteral("/assets/");
	}

	QUrl Assets::url() const {
		return QUrl::fromLocalFile(_directory);
	}

	bool Assets::exists(const QString& path) const {
		return QFile::exists(_directory + path);
	}
}
