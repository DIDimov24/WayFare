#include "WayFare.Presentation/helpers/Cursor/Cursor.hpp"

#include <QCoreApplication>
#include <QCursor>
#include <QPointF>
#include <windows.h>

namespace WayFare::Presentation {
	Cursor::Cursor(QObject* parent) : QObject(parent) {
		_rawDeltaX = 0;
		_rawDeltaY = 0;

		RAWINPUTDEVICE mouse = { 1, 2, 0, nullptr }; // nullptr follows the focused window
		_useCursorPosition = !RegisterRawInputDevices(&mouse, 1, sizeof(mouse));

		QCoreApplication::instance()->installNativeEventFilter(this);
	}

	bool Cursor::nativeEventFilter(const QByteArray&, void* message, qintptr*) {
		MSG* msg = (MSG*)message;

		if (msg->message != WM_INPUT) {
			return false;
		}

		RAWINPUT raw;
		UINT size = sizeof(raw);

		if (GetRawInputData((HRAWINPUT)msg->lParam, RID_INPUT, &raw, &size, sizeof(RAWINPUTHEADER)) == UINT(-1)) {
			return false;
		}

		if (raw.header.dwType != RIM_TYPEMOUSE) {
			return false;
		}

		if (raw.data.mouse.usFlags & MOUSE_MOVE_ABSOLUTE) {
			_useCursorPosition = true;
			return false;
		}

		_rawDeltaX = _rawDeltaX + int(raw.data.mouse.lLastX);
		_rawDeltaY = _rawDeltaY + int(raw.data.mouse.lLastY);
		return false;
	}

	void Cursor::center(QQuickItem* item) {
		QPointF center = item->mapToGlobal(QPointF(item->width() / 2, item->height() / 2));
		QCursor::setPos(center.toPoint());
		_rawDeltaX = 0;
		_rawDeltaY = 0;
	}

	QPoint Cursor::takeDelta(QQuickItem* item) {
		QPoint center = item->mapToGlobal(QPointF(item->width() / 2, item->height() / 2)).toPoint();
		QPoint moved = QCursor::pos() - center;
		QPoint delta(_rawDeltaX, _rawDeltaY);
		_rawDeltaX = 0;
		_rawDeltaY = 0;

		if (_useCursorPosition) {
			delta = moved;
		}

		if (!moved.isNull()) {
			QCursor::setPos(center);
		}

		return delta;
	}
}
