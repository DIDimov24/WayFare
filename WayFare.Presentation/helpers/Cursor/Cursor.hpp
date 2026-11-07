#pragma once

#include <QAbstractNativeEventFilter>
#include <QObject>
#include <QPoint>
#include <QQuickItem>
#include <QtQml/qqmlregistration.h>

namespace WayFare::Presentation {
	class Cursor : public QObject, public QAbstractNativeEventFilter {
		Q_OBJECT QML_NAMED_ELEMENT(Cursor) QML_SINGLETON

	public:
		explicit Cursor(QObject* parent = nullptr);

		bool nativeEventFilter(const QByteArray& eventType, void* message, qintptr* result) override;

	public slots:
		void center(QQuickItem* item);
		QPoint takeDelta(QQuickItem* item);

	private:
		int _rawDeltaX;
		int _rawDeltaY;
		bool _useCursorPosition;
	};
}
