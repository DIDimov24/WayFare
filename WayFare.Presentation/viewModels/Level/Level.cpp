#include "WayFare.Presentation/viewModels/Level/Level.hpp"

#include <algorithm>
#include <cmath>
#include <random>
#include <QPoint>
#include <QRandomGenerator>
#include <QVariantMap>

#include "WayFare.Business/Boss/BossFight.hpp"
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

	void levelAddSectorTorches(QVariantList& decor, const Business::Maze& maze, std::mt19937& rng, int arenaFirst) {
		const int sectors = 3;
		std::vector<int> stepX = { 1, -1, 0, 0 };
		std::vector<int> stepY = { 0, 0, 1, -1 };
		int size = int(maze.tiles.size());

		for (int sectorY = 0; sectorY < sectors; sectorY++) {
			for (int sectorX = 0; sectorX < sectors; sectorX++) {
				std::vector<int> spotX;
				std::vector<int> spotY;
				std::vector<int> spotSide;

				for (int y = sectorY * size / sectors; y < (sectorY + 1) * size / sectors; y++) {
					for (int x = sectorX * size / sectors; x < (sectorX + 1) * size / sectors; x++) {
						if (maze.tiles[y][x] != Business::Tile::Path || (x >= arenaFirst && y >= arenaFirst)) {
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
	}

	QVariantList levelDungeonDecor(const Business::Maze& maze, uint32_t seed) {
		std::mt19937 rng(seed + 104729u);
		QVariantList decor;

		decor.append(levelTorchEntry(1, 1, 3, 0.0));
		levelAddSectorTorches(decor, maze, rng, int(maze.tiles.size()));

		return decor;
	}

	void levelAddArenaTorches(QVariantList& decor, const Business::Maze& maze, std::mt19937& rng, int arenaFirst) {
		int last = int(maze.tiles.size()) - 2;
		int middle = (arenaFirst + last) / 2;

		decor.append(levelTorchEntry(last, middle, 0, (rng() % 628) / 100.0));
		decor.append(levelTorchEntry(arenaFirst, middle, 1, (rng() % 628) / 100.0));
		decor.append(levelTorchEntry(middle - Business::villageGateHalfWidth - 2, last, 2, (rng() % 628) / 100.0));
		decor.append(levelTorchEntry(middle, arenaFirst, 3, (rng() % 628) / 100.0));
	}

	bool levelIsWallRun(const Business::Maze& maze, int x, int y, bool alongX, int length) {
		for (int i = 0; i < length; i++) {
			int tileX = alongX ? x + i : x;
			int tileY = alongX ? y : y + i;
			if (tileX <= 0 || tileY <= 0 || tileX >= int(maze.tiles.size()) - 1 || tileY >= int(maze.tiles.size()) - 1) {
				return false;
			}
			if (maze.tiles[tileY][tileX] != Business::Tile::Wall) {
				return false;
			}
		}
		return true;
	}

	void levelAddCabinFront(QVariantList& decor, std::mt19937& rng, int tileX, int tileY, bool alongX, bool door) {
		double yaw = alongX ? 0.0 : 90.0;
		for (int side = 0; side < 2; side++) {
			double faceX = alongX ? tileX + 0.5 : tileX + double(side);
			double faceY = alongX ? tileY + double(side) : tileY + 0.5;
			if (door && side == 0) {
				decor.append(levelDecorEntry(QStringLiteral("door"), faceX, faceY, yaw, 1.0, 0.0));
				continue;
			}
			decor.append(levelDecorEntry(QStringLiteral("window"), faceX, faceY, yaw, 1.0, rng() % 100 < 65 ? 1.0 : 0.0));
		}
	}

	void levelAddCabins(QVariantList& decor, const Business::Maze& maze, std::mt19937& rng) {
		const int sectors = 5;
		const int cabinLength = 5;
		int size = int(maze.tiles.size());

		for (int sectorY = 0; sectorY < sectors; sectorY++) {
			for (int sectorX = 0; sectorX < sectors; sectorX++) {
				std::vector<int> spotX;
				std::vector<int> spotY;
				std::vector<bool> spotAlongX;

				for (int y = sectorY * size / sectors; y < (sectorY + 1) * size / sectors; y++) {
					for (int x = sectorX * size / sectors; x < (sectorX + 1) * size / sectors; x++) {
						if (x % 2 != 0 || y % 2 != 0) {
							continue;
						}
						if (levelIsWallRun(maze, x, y, true, cabinLength)) {
							spotX.push_back(x);
							spotY.push_back(y);
							spotAlongX.push_back(true);
						}
						if (levelIsWallRun(maze, x, y, false, cabinLength)) {
							spotX.push_back(x);
							spotY.push_back(y);
							spotAlongX.push_back(false);
						}
					}
				}

				if (spotX.size() == 0 || rng() % 100 >= 70) {
					continue;
				}

				size_t index = rng() % spotX.size();
				int x = spotX[index];
				int y = spotY[index];
				bool alongX = spotAlongX[index];
				double centerX = alongX ? x + cabinLength / 2.0 : x + 0.5;
				double centerY = alongX ? y + 0.5 : y + cabinLength / 2.0;
				decor.append(levelDecorEntry(QStringLiteral("cabin"), centerX, centerY, alongX ? 0.0 : 90.0, double(cabinLength), 0.0));
				levelAddCabinFront(decor, rng, alongX ? x + 1 : x, alongX ? y : y + 1, alongX, true);
				levelAddCabinFront(decor, rng, alongX ? x + 3 : x, alongX ? y : y + 3, alongX, false);
			}
		}
	}

	void levelAddVillageProps(QVariantList& decor, const Business::Maze& maze, std::mt19937& rng, int arenaFirst, const std::vector<Business::Pickup>& pickups) {
		std::vector<int> stepX = { 1, -1, 0, 0 };
		std::vector<int> stepY = { 0, 0, 1, -1 };

		for (size_t y = 0; y < maze.tiles.size(); y++) {
			for (size_t x = 0; x < maze.tiles[y].size(); x++) {
				if (maze.tiles[y][x] != Business::Tile::Path || (int(x) >= arenaFirst && int(y) >= arenaFirst)) {
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

				for (size_t side = 0; side < stepX.size(); side++) {
					if (!levelIsWallTile(maze, int(x) + stepX[side], int(y) + stepY[side]) || rng() % 100 >= 9) {
						continue;
					}

					double slide = (int(rng() % 51) - 25) / 100.0;
					double propX = int(x) + 0.5 + stepX[side] * 0.36;
					double propY = int(y) + 0.5 + stepY[side] * 0.36;
					if (stepX[side] == 0) {
						propX = propX + slide;
					}
					if (stepY[side] == 0) {
						propY = propY + slide;
					}

					int roll = int(rng() % 100);
					double yaw = double(rng() % 360);
					double size = (rng() % 41) / 100.0;
					if (roll < 45) {
						decor.append(levelDecorEntry(QStringLiteral("grass"), propX, propY, yaw, 1.0 + size, 0.0));
					}
					else if (roll < 70) {
						decor.append(levelDecorEntry(QStringLiteral("rock"), propX, propY, yaw, 0.6 + size, 0.0));
					}
					else if (roll < 88) {
						decor.append(levelDecorEntry(QStringLiteral("stump"), propX, propY, yaw, 1.2 + size, 0.0));
					}
					else {
						decor.append(levelDecorEntry(QStringLiteral("logs"), propX, propY, yaw, 1.0 + size, 0.0));
					}
				}
			}
		}
	}

	void levelAddVillagePines(QVariantList& decor, const Business::Maze& maze, std::mt19937& rng) {
		int size = int(maze.tiles.size());
		int gateX = (size - 1 - Business::villageArenaSize + size - 2) / 2;
		std::vector<double> outsideX = { -9.0, -3.0, 2.0, 9.0, -7.0, 11.0, 4.5, -11.0 };
		std::vector<double> outsideY = { 3.0, 8.0, 10.0, 2.5, 9.0, 7.0, 12.0, 6.0 };
		for (size_t i = 0; i < outsideX.size(); i++) {
			decor.append(levelDecorEntry(QStringLiteral("pine"), gateX + 0.5 + outsideX[i], size + outsideY[i], double(rng() % 360), 5.5 + (rng() % 300) / 100.0, double(i % 2)));
		}

		for (int y = 1; y < size - 1; y++) {
			for (int x = 1; x < size - 1; x++) {
				if (maze.tiles[y][x] == Business::Tile::Wall && rng() % 100 < 8) {
					decor.append(levelDecorEntry(QStringLiteral("pine"), x + 0.5, y + 0.5, double(rng() % 360), 5.0 + (rng() % 300) / 100.0, double(rng() % 2)));
				}
			}
		}

		for (int ring = 1; ring <= 3; ring++) {
			for (int i = -ring; i < size + ring; i += 2) {
				std::vector<double> ringX = { double(i), double(i), -ring + 0.5, size + ring - 0.5 };
				std::vector<double> ringY = { -ring + 0.5, size + ring - 0.5, double(i), double(i) };
				for (size_t side = 0; side < ringX.size(); side++) {
					if (side == 1 && i >= gateX - 6 && i <= gateX + 7) {
						continue;
					}
					double jitterX = (int(rng() % 81) - 40) / 100.0;
					double jitterY = (int(rng() % 81) - 40) / 100.0;
					decor.append(levelDecorEntry(QStringLiteral("pine"), ringX[side] + jitterX, ringY[side] + jitterY, double(rng() % 360), 6.0 + (rng() % 400) / 100.0, double(rng() % 2)));
				}
			}
		}
	}

	QVariantList levelVillageDecor(const Business::Maze& maze, uint32_t seed, const std::vector<Business::Pickup>& pickups) {
		std::mt19937 rng(seed + 15485863u);
		int arenaFirst = int(maze.tiles.size()) - 1 - Business::villageArenaSize;
		QVariantList decor;

		levelAddSectorTorches(decor, maze, rng, arenaFirst);
		levelAddArenaTorches(decor, maze, rng, arenaFirst);
		levelAddCabins(decor, maze, rng);
		levelAddVillageProps(decor, maze, rng, arenaFirst, pickups);
		levelAddVillagePines(decor, maze, rng);

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

	bool levelIsEnemyInSight(const Business::Maze& maze, const Business::Player& player, const Business::Enemy& enemy, double sightRange) {
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
		if (state == Business::EnemyState::Dormant) {
			return QStringLiteral("dormant");
		}
		return QStringLiteral("idle");
	}

	QString levelBossState(Business::BossState state) {
		if (state == Business::BossState::Intro) {
			return QStringLiteral("intro");
		}
		if (state == Business::BossState::Roaring) {
			return QStringLiteral("roaring");
		}
		if (state == Business::BossState::Chasing) {
			return QStringLiteral("chasing");
		}
		if (state == Business::BossState::Swiping) {
			return QStringLiteral("swiping");
		}
		if (state == Business::BossState::Slamming) {
			return QStringLiteral("slamming");
		}
		if (state == Business::BossState::Charging) {
			return QStringLiteral("charging");
		}
		if (state == Business::BossState::Recovering) {
			return QStringLiteral("recovering");
		}
		if (state == Business::BossState::Dead) {
			return QStringLiteral("dead");
		}
		return QStringLiteral("waiting");
	}

	Level::Level(Settings& settings, Game& game, QObject* parent) : QObject(parent), _settings(settings), _game(game) {
		_player = { 0.0, 0.0, 0.0, 0, 0.0 };
		_inventory = Business::createInventory();
		_startInventory = Business::createInventory();
		_drowning = Business::createDrowning();
		_combat = Business::createCombat();
		_weapon = Business::ItemType::Sword;
		_boss = Business::createBoss(_maze, 0);
		_number = 1;
		_seed = 0;
		_exitX = 0;
		_exitY = 0;
		_onExit = false;
		_dead = false;
		_hasBoss = false;
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
		double sightRange = _theme == QStringLiteral("village") ? 12.0 : 9.0;
		QVariantList list;
		for (size_t i = 0; i < _enemies.size(); i++) {
			QVariantMap enemy;
			enemy.insert(QStringLiteral("x"), _enemies[i].x);
			enemy.insert(QStringLiteral("y"), _enemies[i].y);
			enemy.insert(QStringLiteral("facing"), _enemies[i].facing);
			enemy.insert(QStringLiteral("state"), levelEnemyState(_enemies[i].state));
			enemy.insert(QStringLiteral("hurt"), _enemies[i].hurtTime > 0.0);
			enemy.insert(QStringLiteral("seen"), levelIsEnemyInSight(_maze, _player, _enemies[i], sightRange));
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

	bool Level::hasBoss() const {
		return _hasBoss;
	}

	QVariantMap Level::boss() const {
		QVariantMap boss;
		boss.insert(QStringLiteral("x"), _boss.x);
		boss.insert(QStringLiteral("y"), _boss.y);
		boss.insert(QStringLiteral("facing"), _boss.facing);
		boss.insert(QStringLiteral("state"), levelBossState(_boss.state));
		boss.insert(QStringLiteral("health"), _boss.health);
		boss.insert(QStringLiteral("phase"), _boss.phase);
		boss.insert(QStringLiteral("hurt"), _boss.hurtTime > 0.0);
		boss.insert(QStringLiteral("attack"), _boss.attackCount);
		boss.insert(QStringLiteral("arenaFirst"), _boss.arenaFirst);
		boss.insert(QStringLiteral("arenaLast"), _boss.arenaLast);
		return boss;
	}

	bool Level::bossCutscene() const {
		return _hasBoss && Business::isBossCutscenePlaying(_boss);
	}

	int Level::bossMaxHealth() const {
		return Business::bossMaxHealth;
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
			Business::carveArena(_maze, Business::villageArenaSize);
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
		if (number == 3) {
			_decor = levelVillageDecor(_maze, seed, _pickups);
		}

		_enemies.clear();
		_traps.clear();
		if (number == 2) {
			_enemies = Business::spawnEnemies(_maze, seed, Business::EnemyType::Zombie, Business::dungeonZombieCount, 0);
			_traps = Business::placeSpikeTraps(_maze, seed, Business::dungeonSpikeTrapCount, _pickups);
		}
		if (number == 3) {
			_enemies = Business::spawnEnemies(_maze, seed, Business::EnemyType::NightmareCreature, Business::villageCreatureCount, Business::villageArenaSize);
		}
		_combat = Business::createCombat();
		_weapon = Business::ItemType::Sword;
		_hasBoss = number == 3;
		_boss = Business::createBoss(_maze, Business::villageArenaSize);
		if (_hasBoss) {
			_exitX = Business::getVillageGateX(_boss);
			_exitY = Business::getVillageGateY(_boss);
			for (qsizetype i = _walls.size() - 1; i >= 0; i--) {
				QPoint wall = _walls[i].toPoint();
				if (wall.y() == _exitY && wall.x() >= _exitX - Business::villageGateHalfWidth && wall.x() <= _exitX + Business::villageGateHalfWidth) {
					_walls.removeAt(i);
				}
			}
		}
		if (_hasBoss) {
			std::vector<Business::Enemy> minions = Business::createBossMinions(_boss);
			for (size_t i = 0; i < minions.size(); i++) {
				_enemies.push_back(minions[i]);
			}
		}

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
		emit bossChanged();
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

		bool cutscene = bossCutscene();
		if (!cutscene) {
			Business::movePlayer(_player, _maze, forward, strafe, deltaTime);
		}
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
		if (_enemies.size() > 0 && !cutscene) {
			Business::EnemyUpdateResponse response = Business::updateEnemies(_enemies, _player, _maze, deltaTime);
			damaged = response.playerHit;
			emit enemiesChanged();
		}

		if (_traps.size() > 0) {
			Business::TrapUpdateResponse response = Business::updateSpikeTraps(_traps, _player, deltaTime);
			damaged = damaged || response.playerHit;
			emit trapsChanged();
		}

		if (_hasBoss) {
			Business::BossUpdateResponse response = Business::updateBoss(_boss, _player, _maze, deltaTime);
			Business::pushEnemiesFromBoss(_boss, _enemies, _player, _maze);
			damaged = damaged || response.playerHit;
			if (cutscene && _boss.state == Business::BossState::Intro) {
				_pitch = _pitch * (1.0 - std::min(1.0, deltaTime * 3.0));
			}
			emit bossChanged();
			emit playerChanged();

			if (response.slammed) {
				emit bossSlammed();
			}

			if (response.defeated) {
				Business::openVillageGate(_maze, _boss);
				emit bossDefeated();
			}
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

		if (_hasBoss) {
			Business::ExitStatus status = Business::checkVillageExit(_player, _maze, _boss);
			bool locked = status == Business::ExitStatus::Locked;
			if (locked && !_onExit) {
				emit exitLocked(QString::fromStdString(Business::villageExitLockedMessage));
			}
			_onExit = locked;

			if (status == Business::ExitStatus::Success) {
				_game.setPhase(QStringLiteral("ending"));
			}
			return;
		}

		_onExit = Business::isPlayerOnExit(_player, _maze);
	}

	void Level::attack() {
		if (_dead || !armed() || bossCutscene()) {
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

		bool bossHit = false;
		if (_hasBoss) {
			Business::BossHitStatus status = Business::BossHitStatus::Miss;
			if (_weapon == Business::ItemType::Pistol) {
				status = Business::hitBossWithPistol(_boss, _player, response.distance);
			}
			else {
				status = Business::hitBossWithSword(_boss, _player);
			}
			bossHit = status == Business::BossHitStatus::Success || status == Business::BossHitStatus::PhaseChanged || status == Business::BossHitStatus::Killed;
			if (status == Business::BossHitStatus::PhaseChanged) {
				Business::summonBossMinions(_enemies, _boss);
			}
			emit bossChanged();
		}

		emit enemiesChanged();
		emit weaponUsed(levelItemKey(_weapon), response.hitCount > 0 || bossHit);
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
		if (_dead || bossCutscene()) {
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
