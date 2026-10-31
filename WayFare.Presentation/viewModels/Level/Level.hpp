#pragma once

#include <cstdint>
#include <QObject>
#include <QString>
#include <QStringList>
#include <QVariantList>
#include <QtQml/qqmlregistration.h>

#include "WayFare.Business/models/Drowning.hpp"
#include "WayFare.Business/models/Inventory.hpp"
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
		Q_PROPERTY(int health READ health NOTIFY hudChanged)
		Q_PROPERTY(int maxHealth READ maxHealth CONSTANT)
		Q_PROPERTY(double air READ air NOTIFY hudChanged)
		Q_PROPERTY(bool showAir READ showAir NOTIFY hudChanged)
		Q_PROPERTY(QStringList items READ items NOTIFY hudChanged)
		Q_PROPERTY(int potionCount READ potionCount NOTIFY hudChanged)

	public:
		explicit Level(Settings& settings, QObject* parent = nullptr);

		int size() const;
		QString theme() const;
		QVariantList walls() const;
		double playerX() const;
		double playerY() const;
		double facing() const;
		double pitch() const;
		int health() const;
		int maxHealth() const;
		double air() const;
		bool showAir() const;
		QStringList items() const;
		int potionCount() const;

		void load(int number, uint32_t seed);

	public slots:
		void move(double forward, double strafe, double deltaTime);
		void look(double mouseDeltaX, double mouseDeltaY);

	signals:
		void mazeChanged();
		void playerChanged();
		void hudChanged();

	private:
		Settings& _settings;
		Business::Maze _maze;
		Business::Player _player;
		Business::Inventory _inventory;
		Business::Drowning _drowning;
		QString _theme;
		QVariantList _walls;
		double _pitch;
	};
}
