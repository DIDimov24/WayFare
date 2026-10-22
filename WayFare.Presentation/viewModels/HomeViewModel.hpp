#pragma once

#include <QObject>
#include <QString>

namespace WayFare::Presentation {
	class HomeViewModel : public QObject {
		Q_OBJECT Q_PROPERTY(QString greeting READ greeting NOTIFY greetingChanged)

	public:
		explicit HomeViewModel(QObject* parent = nullptr);

		QString greeting() const;

	public slots:
		void setGreeting(const QString& greeting);

	signals:
		void greetingChanged();

	private:
		QString _greeting;
	};
}
