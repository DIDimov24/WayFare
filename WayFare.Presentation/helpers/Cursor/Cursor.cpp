#include "WayFare.Presentation/helpers/Cursor/Cursor.hpp"

#include <QCursor>
#include <QPointF>

namespace WayFare::Presentation {
	Cursor::Cursor(QObject* parent) : QObject(parent) {
	}

	void Cursor::center(QQuickItem* item) {
		QPointF center = item->mapToGlobal(QPointF(item->width() / 2, item->height() / 2));
		QCursor::setPos(center.toPoint());
	}
}
