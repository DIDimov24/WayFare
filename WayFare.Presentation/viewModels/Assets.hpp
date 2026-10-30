#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>
#include <QString>
#include <QUrl>

namespace WayFare::Presentation {
	class Assets : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Assets) QML_SINGLETON Q_PROPERTY(QUrl url READ url CONSTANT)

	public:
		explicit Assets(QObject* parent = nullptr);

		QUrl url() const;

		Q_INVOKABLE bool exists(const QString& path) const;

	private:
		QString _directory;
	};
}
