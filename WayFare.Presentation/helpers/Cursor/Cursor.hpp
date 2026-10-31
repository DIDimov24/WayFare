#pragma once

#include <QObject>
#include <QQuickItem>
#include <QtQml/qqmlregistration.h>

namespace WayFare::Presentation {
	class Cursor : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Cursor) QML_SINGLETON

	public:
		explicit Cursor(QObject* parent = nullptr);

	public slots:
		void center(QQuickItem* item);
	};
}
