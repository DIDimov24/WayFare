#pragma once

#include <cstdint>
#include <QObject>
#include <QString>
#include <QVariantList>
#include <QtQml/qqmlregistration.h>

#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"
#include "WayFare.Presentation/viewModels/Settings/Settings.hpp"

namespace WayFare::Presentation {
	class Level : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Level) QML_SINGLETON
		Q_PROPERTY(int size READ size NOTIFY mazeChanged)
		Q_PROPERTY(QString theme READ theme NOTIFY mazeChanged)
		Q_PROPERTY(QVariantList walls READ walls NOTIFY mazeChanged)
		Q_PROPERTY(double playerX READ playerX NOTIFY playerChanged)
		Q_PROPERTY(double playerY READ playerY NOTIFY playerChanged)
		Q_PROPERTY(double facing READ facing NOTIFY playerChanged)
		Q_PROPERTY(double pitch READ pitch NOTIFY playerChanged)

	public:
		explicit Level(Settings& settings, QObject* parent = nullptr);

		int size() const;
		QString theme() const;
		QVariantList walls() const;
		double playerX() const;
		double playerY() const;
		double facing() const;
		double pitch() const;

		void load(int number, uint32_t seed);

	public slots:
		void move(double forward, double strafe, double deltaTime);
		void look(double mouseDeltaX, double mouseDeltaY);

	signals:
		void mazeChanged();
		void playerChanged();

	private:
		Settings& _settings;
		Business::Maze _maze;
		Business::Player _player;
		QString _theme;
		QVariantList _walls;
		double _pitch;
	};
}
