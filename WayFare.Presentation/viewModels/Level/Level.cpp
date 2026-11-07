#include "WayFare.Presentation/viewModels/Level/Level.hpp"

#include <cmath>
#include <random>
#include <QPoint>
#include <QRandomGenerator>
#include <QVariantMap>

#include "WayFare.Business/Combat/Weapons.hpp"
#include "WayFare.Business/Enemies/EnemyAI.hpp"
#include "WayFare.Business/Enemies/EnemySpawner.hpp"
#include "WayFare.Business/Hazards/Drowning.hpp"
#include "WayFare.Business/Hazards/SpikeTraps.hpp"
#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Inventory/Pickups.hpp"
#include "WayFare.Business/Level/TempleExit.hpp"
#include "WayFare.Business/MazeGenerator/MazeGenerator.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"
#include "WayFare.Business/Player/PlayerMovement.hpp"

namespace WayFare::Presentation {
	const double cameraPitchSpeed = 0.003;
	const double maxCameraPitch = 1.4;

	QString levelItemKey(Business::ItemType type) {
		if (type == Business::ItemType::DivingGear) {
			return QStringLiteral("diving_gear");
		}
		if (type == Business::ItemType::Sword) {
			return QStringLiteral("sword");
		}
		if (type == Business::ItemType::Pistol) {
			return QStringLiteral("pistol");
		}
		return QStringLiteral("potion");
	}

	bool levelIsWallTile(const Business::Maze& maze, int x, int y) {
		int size = int(maze.tiles.size());
		if (x < 0 || y < 0 || x >= size || y >= size) {
			return true;
		}
		return maze.tiles[y][x] == Business::Tile::Wall;
	}

	QVariantMap levelDecorEntry(const QString& kind, double x, double y, double yaw, double scale, double phase) {
		QVariantMap entry;
		entry.insert(QStringLiteral("kind"), kind);
		entry.insert(QStringLiteral("x"), x);
		entry.insert(QStringLiteral("y"), y);
		entry.insert(QStringLiteral("yaw"), yaw);
		entry.insert(QStringLiteral("scale"), scale);
		entry.insert(QStringLiteral("phase"), phase);
		return entry;
	}

	QVariantList levelTempleDecor(const Business::Maze& maze, uint32_t seed, const std::vector<Business::Pickup>& pickups) {
		std::mt19937 rng(seed + 7919u);
		std::vector<int> stepX = { 1, -1, 0, 0 };
		std::vector<int> stepY = { 0, 0, 1, -1 };
		std::vector<int> openX;
		std::vector<int> openY;
		QVariantList decor;

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] == Business::Tile::Wall) {
					continue;
				}
				openX.push_back(int(x));
				openY.push_back(int(y));
				if (maze.tiles[y][x] != Business::Tile::Path) {
					continue;
				}

				bool reserved = false;
				for (size_t i = 0; i < pickups.size(); i++) {
					if (pickups[i].x == int(x) && pickups[i].y == int(y)) {
						reserved = true;
					}
				}
				if (reserved) {
					continue;
				}

				if (rng() % 16 == 0) {
					decor.append(levelDecorEntry(QStringLiteral("vent"), int(x) + 0.5, int(y) + 0.5, 0.0, 1.0, 0.0));
				}

				for (size_t side = 0; side < stepX.size(); side++) {
					if (!levelIsWallTile(maze, int(x) + stepX[side], int(y) + stepY[side]) || rng() % 100 >= 45) {
						continue;
					}

					double slide = (int(rng() % 51) - 25) / 100.0;
					double plantX = int(x) + 0.5 + stepX[side] * 0.36;
					double plantY = int(y) + 0.5 + stepY[side] * 0.36;
					if (stepX[side] == 0) {
						plantX = plantX + slide;
					}
					if (stepY[side] == 0) {
						plantY = plantY + slide;
					}

					int roll = int(rng() % 100);
					QString kind = QStringLiteral("seaweed");
					if (roll >= 55) {
						kind = QStringLiteral("orange_coral");
					}
					if (roll >= 78) {
						kind = QStringLiteral("fan_coral");
					}
					double yaw = double(rng() % 360);
					double scale = 0.8 + (rng() % 46) / 100.0;
					double phase = (rng() % 628) / 100.0;
					decor.append(levelDecorEntry(kind, plantX, plantY, yaw, scale, phase));
				}
			}
		}

		for (int i = 0; i < 9 && openX.size() > 0; i++) {
			size_t index = rng() % openX.size();
			QString kind = QStringLiteral("shaft");
			if (i >= 5) {
				kind = QStringLiteral("glow");
			}
			decor.append(levelDecorEntry(kind, openX[index] + 0.5, openY[index] + 0.5, 0.0, 1.0, 0.0));
			openX.erase(openX.begin() + index);
			openY.erase(openY.begin() + index);
		}

		return decor;
	}

	QVariantMap levelTorchEntry(int x, int y, int side, double phase) {
		std::vector<int> stepX = { 1, -1, 0, 0 };
		std::vector<int> stepY = { 0, 0, 1, -1 };
		std::vector<double> sideYaw = { -90.0, 90.0, 180.0, 0.0 };
		return levelDecorEntry(QStringLiteral("torch"), x + 0.5 + stepX[side] * 0.5, y + 0.5 + stepY[side] * 0.5, sideYaw[side], 1.0, phase);
	}

	QVariantList levelDungeonDecor(const Business::Maze& maze, uint32_t seed) {
		const int sectors = 3;
		std::mt19937 rng(seed + 104729u);
		std::vector<int> stepX = { 1, -1, 0, 0 };
		std::vector<int> stepY = { 0, 0, 1, -1 };
		int size = int(maze.tiles.size());
		QVariantList decor;

		decor.append(levelTorchEntry(1, 1, 3, 0.0));

		for (int sectorY = 0; sectorY < sectors; sectorY++) {
			for (int sectorX = 0; sectorX < sectors; sectorX++) {
				std::vector<int> spotX;
				std::vector<int> spotY;
				std::vector<int> spotSide;

				for (int y = sectorY * size / sectors; y < (sectorY + 1) * size / sectors; y++) {
					for (int x = sectorX * size / sectors; x < (sectorX + 1) * size / sectors; x++) {
						if (maze.tiles[y][x] != Business::Tile::Path) {
							continue;
						}
						for (size_t side = 0; side < stepX.size(); side++) {
							if (levelIsWallTile(maze, x + stepX[side], y + stepY[side])) {
								spotX.push_back(x);
								spotY.push_back(y);
								spotSide.push_back(int(side));
							}
						}
					}
				}

				if (spotX.size() == 0) {
					continue;
				}

				size_t index = rng() % spotX.size();
				decor.append(levelTorchEntry(spotX[index], spotY[index], spotSide[index], (rng() % 628) / 100.0));
			}
		}

		return decor;
	}

	bool levelHasClearRay(const Business::Maze& maze, double fromX, double fromY, double toX, double toY) {
		const double rayStep = 0.1;
		double dx = toX - fromX;
		double dy = toY - fromY;
		int steps = int(std::sqrt(dx * dx + dy * dy) / rayStep);

		for (int step = 1; step <= steps; step++) {
			double progress = double(step) / steps;
			if (levelIsWallTile(maze, int(std::floor(fromX + dx * progress)), int(std::floor(fromY + dy * progress)))) {
				return false;
			}
		}
		return true;
	}

	bool levelIsEnemyInSight(const Business::Maze& maze, const Business::Player& player, const Business::Enemy& enemy) {
		const double sightRange = 9.0;
		const double bodyHalfWidth = 0.3;
		double dx = enemy.x - player.x;
		double dy = enemy.y - player.y;
		double distance = std::sqrt(dx * dx + dy * dy);

		if (distance > sightRange) {
			return false;
		}

		if (distance < 0.0001) {
			return true;
		}

		double sideX = -dy / distance * bodyHalfWidth;
		double sideY = dx / distance * bodyHalfWidth;
		return levelHasClearRay(maze, player.x, player.y, enemy.x, enemy.y)
			|| levelHasClearRay(maze, player.x, player.y, enemy.x + sideX, enemy.y + sideY)
			|| levelHasClearRay(maze, player.x, player.y, enemy.x - sideX, enemy.y - sideY);
	}

	QString levelEnemyState(Business::EnemyState state) {
		if (state == Business::EnemyState::Alerted) {
			return QStringLiteral("alerted");
		}
		if (state == Business::EnemyState::Chasing) {
			return QStringLiteral("chasing");
		}
		if (state == Business::EnemyState::Attacking) {
			return QStringLiteral("attacking");
		}
		if (state == Business::EnemyState::Dead) {
			return QStringLiteral("dead");
		}
		return QStringLiteral("idle");
	}

	Level::Level(Settings& settings, Game& game, QObject* parent) : QObject(parent), _settings(settings), _game(game) {
		_player = { 0.0, 0.0, 0.0, 0, 0.0 };
		_inventory = Business::createInventory();
		_startInventory = Business::createInventory();
		_drowning = Business::createDrowning();
		_combat = Business::createCombat();
		_weapon = Business::ItemType::Sword;
		_number = 1;
		_seed = 0;
		_exitX = 0;
		_exitY = 0;
		_onExit = false;
		_dead = false;
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

	int Level::exitX() const {
		return _exitX;
	}

	int Level::exitY() const {
		return _exitY;
	}

	QVariantList Level::decor() const {
		return _decor;
	}

	bool Level::dead() const {
		return _dead;
	}

	QString Level::deathMessage() const {
		return _deathMessage;
	}

	bool Level::exitUnlocked() const {
		if (_theme == QStringLiteral("temple")) {
			return Business::isTempleExitUnlocked(_inventory);
		}
		return true;
	}

	QVariantList Level::pickups() const {
		QVariantList list;
		for (size_t i = 0; i < _pickups.size(); i++) {
			if (_pickups[i].collected) {
				continue;
			}

			QVariantMap pickup;
			pickup.insert(QStringLiteral("x"), _pickups[i].x);
			pickup.insert(QStringLiteral("y"), _pickups[i].y);
			pickup.insert(QStringLiteral("type"), levelItemKey(_pickups[i].type));
			list.append(pickup);
		}
		return list;
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
		QStringList keys;
		for (size_t i = 0; i < _inventory.items.size(); i++) {
			if (_inventory.items[i] != Business::ItemType::Potion) {
				keys.append(levelItemKey(_inventory.items[i]));
			}
		}
		return keys;
	}

	int Level::potionCount() const {
		return _inventory.potionCount;
	}

	bool Level::armed() const {
		if (_theme == QStringLiteral("temple")) {
			return false;
		}
		return Business::hasItem(_inventory, Business::ItemType::Sword) || Business::hasItem(_inventory, Business::ItemType::Pistol);
	}

	QString Level::weapon() const {
		return levelItemKey(_weapon);
	}

	int Level::enemyCount() const {
		return int(_enemies.size());
	}

	QVariantList Level::enemies() const {
		QVariantList list;
		for (size_t i = 0; i < _enemies.size(); i++) {
			QVariantMap enemy;
			enemy.insert(QStringLiteral("x"), _enemies[i].x);
			enemy.insert(QStringLiteral("y"), _enemies[i].y);
			enemy.insert(QStringLiteral("facing"), _enemies[i].facing);
			enemy.insert(QStringLiteral("state"), levelEnemyState(_enemies[i].state));
			enemy.insert(QStringLiteral("hurt"), _enemies[i].hurtTime > 0.0);
			enemy.insert(QStringLiteral("seen"), levelIsEnemyInSight(_maze, _player, _enemies[i]));
			list.append(enemy);
		}
		return list;
	}

	QVariantList Level::traps() const {
		QVariantList list;
		for (size_t i = 0; i < _traps.size(); i++) {
			list.append(QPoint(_traps[i].x, _traps[i].y));
		}
		return list;
	}

	QVariantList Level::trapHeights() const {
		QVariantList list;
		for (size_t i = 0; i < _traps.size(); i++) {
			list.append(Business::getSpikeTrapHeight(_traps[i]));
		}
		return list;
	}

	void Level::load(int number, uint32_t seed) {
		_number = number;
		_seed = seed;
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
				if (_maze.tiles[y][x] == Business::Tile::Exit) {
					_exitX = int(x);
					_exitY = int(y);
				}
			}
		}

		std::vector<Business::ItemType> levelItems;
		if (number == 1) {
			levelItems.push_back(Business::ItemType::DivingGear);
			levelItems.push_back(Business::ItemType::Sword);
			levelItems.push_back(Business::ItemType::Pistol);
		}
		_pickups = Business::placePickups(_maze, seed, levelItems);

		_decor.clear();
		if (number == 1) {
			_decor = levelTempleDecor(_maze, seed, _pickups);
		}
		if (number == 2) {
			_decor = levelDungeonDecor(_maze, seed);
		}

		_enemies.clear();
		_traps.clear();
		if (number == 2) {
			_enemies = Business::spawnEnemies(_maze, seed, Business::EnemyType::Zombie, Business::dungeonZombieCount, 0);
			_traps = Business::placeSpikeTraps(_maze, seed, Business::dungeonSpikeTrapCount, _pickups);
		}
		_combat = Business::createCombat();
		_weapon = Business::ItemType::Sword;

		_player = Business::createPlayer(_maze);
		if (number == 1) {
			_startInventory = Business::createInventory();
		}
		_inventory = _startInventory;
		_drowning = Business::createDrowning();
		_onExit = false;
		_dead = false;
		_deathMessage.clear();
		_pitch = 0.0;

		emit enemiesChanged();
		emit trapsChanged();
		emit weaponChanged();
		emit mazeChanged();
		emit playerChanged();
		emit hudChanged();
		emit inventoryChanged();
		emit pickupsChanged();
		emit deadChanged();
	}

	void Level::move(double forward, double strafe, double deltaTime) {
		if (_maze.tiles.size() == 0 || _dead) {
			return;
		}

		Business::movePlayer(_player, _maze, forward, strafe, deltaTime);
		emit playerChanged();

		std::vector<Business::ItemType> collected = Business::collectPickups(_player, _inventory, _pickups);
		if (collected.size() > 0) {
			emit inventoryChanged();
			emit pickupsChanged();
		}

		for (size_t i = 0; i < collected.size(); i++) {
			emit itemCollected(levelItemKey(collected[i]));
		}

		int health = _player.health;
		double air = _drowning.air;
		Business::updatePlayerHealth(_player, deltaTime);
		Business::updateCombat(_combat, deltaTime);
		Business::DrowningStatus drowning = Business::DrowningStatus::Protected;
		if (_theme == QStringLiteral("temple")) {
			drowning = Business::updateDrowning(_drowning, _player, _inventory, deltaTime);
		}

		bool damaged = false;
		if (_enemies.size() > 0) {
			Business::EnemyUpdateResponse response = Business::updateEnemies(_enemies, _player, _maze, deltaTime);
			damaged = response.playerHit;
			emit enemiesChanged();
		}

		if (_traps.size() > 0) {
			Business::TrapUpdateResponse response = Business::updateSpikeTraps(_traps, _player, deltaTime);
			damaged = damaged || response.playerHit;
			emit trapsChanged();
		}

		if (damaged) {
			emit playerDamaged();
		}

		if (_player.health != health || _drowning.air != air) {
			emit hudChanged();
		}

		if (drowning == Business::DrowningStatus::Died || Business::isPlayerDead(_player)) {
			_dead = true;
			_deathMessage = QStringLiteral("You died");
			if (drowning == Business::DrowningStatus::Died) {
				_deathMessage = QStringLiteral("You drowned");
			}
			emit deadChanged();
			return;
		}

		if (_theme == QStringLiteral("temple")) {
			Business::ExitStatus status = Business::checkTempleExit(_player, _maze, _inventory);
			if (status == Business::ExitStatus::Locked && !_onExit) {
				emit exitLocked(QString::fromStdString(Business::templeExitLockedMessage));
			}

			if (status == Business::ExitStatus::Success) {
				_game.setPhase(QStringLiteral("templeExit"));
				return;
			}
		}

		if (_theme == QStringLiteral("dungeon") && Business::isPlayerOnExit(_player, _maze)) {
			_game.setPhase(QStringLiteral("dungeonExit"));
			return;
		}

		_onExit = Business::isPlayerOnExit(_player, _maze);
	}

	void Level::attack() {
		if (_dead || !armed()) {
			return;
		}

		Business::AttackResponse response;
		if (_weapon == Business::ItemType::Pistol) {
			response = Business::firePistol(_combat, _player, _inventory, _maze, _enemies);
		}
		else {
			response = Business::swingSword(_combat, _player, _inventory, _enemies);
		}

		if (!response.success) {
			return;
		}

		emit enemiesChanged();
		emit weaponUsed(levelItemKey(_weapon), response.hitCount > 0);
	}

	void Level::selectWeapon(const QString& weapon) {
		Business::ItemType type = Business::ItemType::Sword;
		if (weapon == QStringLiteral("pistol")) {
			type = Business::ItemType::Pistol;
		}

		if (!armed() || type == _weapon || !Business::hasItem(_inventory, type)) {
			return;
		}

		_weapon = type;
		emit weaponChanged();
	}

	void Level::drinkPotion() {
		if (_dead || Business::usePotion(_player, _inventory) != Business::HealStatus::Success) {
			return;
		}

		emit hudChanged();
		emit inventoryChanged();
		emit potionUsed();
	}

	void Level::respawn() {
		load(_number, _seed);
	}

	void Level::nextLevel() {
		_startInventory = _inventory;
		load(_number + 1, QRandomGenerator::global()->generate());
		_game.setPhase(QStringLiteral("level"));
	}

	void Level::quitToMenu() {
		_game.setPhase(QStringLiteral("menu"));
	}

	void Level::look(double mouseDeltaX, double mouseDeltaY) {
		if (_dead) {
			return;
		}

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
