#include "WayFare.Presentation/viewModels/Level/Level.hpp"

#include <QPoint>

#include "WayFare.Business/Hazards/Drowning.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"
#include "WayFare.Business/Player/PlayerMovement.hpp"

namespace WayFare::Presentation {
	const double cameraPitchSpeed = 0.003;
	const double maxCameraPitch = 1.4;

	Level::Level(Settings& settings, QObject* parent) : QObject(parent), _settings(settings) {
		_player = { 0.0, 0.0, 0.0, 0, 0.0 };
		_inventory = Business::createInventory();
		_drowning = Business::createDrowning();
		_pitch = 0.0;
	}

	int Level::size() const {
		return int(_maze.tiles.size());
	}

	QString Level::theme() const {
		return _theme;
	}

	QVariantList Level::walls() const {
		return _walls;
	}

	double Level::playerX() const {
		return _player.x;
	}

	double Level::playerY() const {
		return _player.y;
	}

	double Level::facing() const {
		return _player.facing;
	}

	double Level::pitch() const {
		return _pitch;
	}

	int Level::health() const {
		return _player.health;
	}

	int Level::maxHealth() const {
		return Business::maxPlayerHealth;
	}

	double Level::air() const {
		return _drowning.air / Business::maxAir;
	}

	bool Level::showAir() const {
		return _theme == QStringLiteral("temple") && !Business::hasItem(_inventory, Business::ItemType::DivingGear);
	}

	QStringList Level::items() const {
		QStringList names;
		for (size_t i = 0; i < _inventory.items.size(); i++) {
			if (_inventory.items[i] == Business::ItemType::DivingGear) {
				names.append(QStringLiteral("Diving gear"));
			}
			if (_inventory.items[i] == Business::ItemType::Sword) {
				names.append(QStringLiteral("Sword"));
			}
			if (_inventory.items[i] == Business::ItemType::Pistol) {
				names.append(QStringLiteral("Pistol"));
			}
		}
		return names;
	}

	int Level::potionCount() const {
		return _inventory.potionCount;
	}

	void Level::load(int number, uint32_t seed) {
		int size = 15;
		_theme = QStringLiteral("temple");
		if (number == 2) {
			size = 25;
			_theme = QStringLiteral("dungeon");
		}
		if (number == 3) {
			size = 45;
			_theme = QStringLiteral("village");
		}

		_maze = Business::generateMaze(size, seed);
		if (number == 3) {
			Business::carveArena(_maze, 15);
		}

		_walls.clear();
		for (size_t y = 0; y < _maze.tiles.size(); y++) {
			for (size_t x = 0; x < _maze.tiles[y].size(); x++) {
				if (_maze.tiles[y][x] == Business::Tile::Wall) {
					_walls.append(QPoint(int(x), int(y)));
				}
			}
		}

		_player = Business::createPlayer(_maze);
		_inventory = Business::createInventory();
		_drowning = Business::createDrowning();
		_pitch = 0.0;

		emit mazeChanged();
		emit playerChanged();
		emit hudChanged();
	}

	void Level::move(double forward, double strafe, double deltaTime) {
		if (_maze.tiles.size() == 0) {
			return;
		}
		Business::movePlayer(_player, _maze, forward, strafe, deltaTime);
		emit playerChanged();
	}

	void Level::look(double mouseDeltaX, double mouseDeltaY) {
		double sensitivity = _settings.sensitivity() / 50.0;
		Business::turnPlayer(_player, mouseDeltaX, sensitivity);

		_pitch = _pitch - mouseDeltaY * sensitivity * cameraPitchSpeed;
		if (_pitch > maxCameraPitch) {
			_pitch = maxCameraPitch;
		}
		if (_pitch < -maxCameraPitch) {
			_pitch = -maxCameraPitch;
		}

		emit playerChanged();
	}
}
