#pragma once

#include <cstdint>
#include <vector>
#include <QObject>
#include <QString>
#include <QStringList>
#include <QVariantList>
#include <QVariantMap>
#include <QtQml/qqmlregistration.h>

#include "WayFare.Business/Game/GameService.hpp"
#include "WayFare.Business/models/Boss.hpp"
#include "WayFare.Business/models/Combat.hpp"
#include "WayFare.Business/models/Drowning.hpp"
#include "WayFare.Business/models/Enemy.hpp"
#include "WayFare.Business/models/Inventory.hpp"
#include "WayFare.Business/models/Maze.hpp"
#include "WayFare.Business/models/Player.hpp"
#include "WayFare.Business/models/SavedGame.hpp"
#include "WayFare.Business/models/Trap.hpp"
#include "WayFare.Presentation/viewModels/Game/Game.hpp"
#include "WayFare.Presentation/viewModels/Settings/Settings.hpp"

namespace WayFare::Presentation {
	class Level : public QObject {
		Q_OBJECT QML_NAMED_ELEMENT(Level) QML_SINGLETON
		Q_PROPERTY(int size READ size NOTIFY mazeChanged)
		Q_PROPERTY(QString theme READ theme NOTIFY mazeChanged)
		Q_PROPERTY(QVariantList walls READ walls NOTIFY mazeChanged)
		Q_PROPERTY(int exitX READ exitX NOTIFY mazeChanged)
		Q_PROPERTY(int exitY READ exitY NOTIFY mazeChanged)
		Q_PROPERTY(QVariantList decor READ decor NOTIFY mazeChanged)
		Q_PROPERTY(bool exitUnlocked READ exitUnlocked NOTIFY inventoryChanged)
		Q_PROPERTY(bool dead READ dead NOTIFY deadChanged)
		Q_PROPERTY(QString deathMessage READ deathMessage NOTIFY deadChanged)
		Q_PROPERTY(QVariantList pickups READ pickups NOTIFY pickupsChanged)
		Q_PROPERTY(double playerX READ playerX NOTIFY playerChanged)
		Q_PROPERTY(double playerY READ playerY NOTIFY playerChanged)
		Q_PROPERTY(double facing READ facing NOTIFY playerChanged)
		Q_PROPERTY(double pitch READ pitch NOTIFY playerChanged)
		Q_PROPERTY(int health READ health NOTIFY hudChanged)
		Q_PROPERTY(int maxHealth READ maxHealth CONSTANT)
		Q_PROPERTY(double air READ air NOTIFY hudChanged)
		Q_PROPERTY(bool showAir READ showAir NOTIFY inventoryChanged)
		Q_PROPERTY(QStringList items READ items NOTIFY inventoryChanged)
		Q_PROPERTY(int potionCount READ potionCount NOTIFY inventoryChanged)
		Q_PROPERTY(bool armed READ armed NOTIFY inventoryChanged)
		Q_PROPERTY(QString weapon READ weapon NOTIFY weaponChanged)
		Q_PROPERTY(int enemyCount READ enemyCount NOTIFY mazeChanged)
		Q_PROPERTY(QVariantList enemies READ enemies NOTIFY enemiesChanged)
		Q_PROPERTY(QVariantList traps READ traps NOTIFY mazeChanged)
		Q_PROPERTY(QVariantList trapHeights READ trapHeights NOTIFY trapsChanged)
		Q_PROPERTY(bool hasBoss READ hasBoss NOTIFY mazeChanged)
		Q_PROPERTY(QVariantMap boss READ boss NOTIFY bossChanged)
		Q_PROPERTY(bool bossCutscene READ bossCutscene NOTIFY bossChanged)
		Q_PROPERTY(int bossMaxHealth READ bossMaxHealth CONSTANT)

	public:
		explicit Level(Settings& settings, Game& game, Business::GameService& gameService, QObject* parent = nullptr);

		int size() const;
		QString theme() const;
		QVariantList walls() const;
		int exitX() const;
		int exitY() const;
		QVariantList decor() const;
		bool exitUnlocked() const;
		bool dead() const;
		QString deathMessage() const;
		QVariantList pickups() const;
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
		bool armed() const;
		QString weapon() const;
		int enemyCount() const;
		QVariantList enemies() const;
		QVariantList traps() const;
		QVariantList trapHeights() const;
		bool hasBoss() const;
		QVariantMap boss() const;
		bool bossCutscene() const;
		int bossMaxHealth() const;

		void load(int number, uint32_t seed);
		void restore(const Business::SavedGame& game);
		void save();

	public slots:
		void move(double forward, double strafe, double deltaTime);
		void look(double mouseDeltaX, double mouseDeltaY);
		void attack();
		void selectWeapon(const QString& weapon);
		void drinkPotion();
		void respawn();
		void nextLevel();
		void quitToMenu();
		void saveAndQuit();

	signals:
		void mazeChanged();
		void playerChanged();
		void hudChanged();
		void inventoryChanged();
		void pickupsChanged();
		void itemCollected(QString item);
		void exitLocked(QString message);
		void deadChanged();
		void weaponChanged();
		void enemiesChanged();
		void trapsChanged();
		void playerDamaged();
		void weaponUsed(QString weapon, bool hit);
		void potionUsed();
		void bossChanged();
		void bossSlammed();
		void bossDefeated();

	private:
		Settings& _settings;
		Game& _game;
		Business::GameService& _gameService;
		Business::Maze _maze;
		Business::Player _player;
		Business::Inventory _inventory;
		Business::Inventory _startInventory;
		Business::Drowning _drowning;
		Business::Combat _combat;
		Business::ItemType _weapon;
		std::vector<Business::Pickup> _pickups;
		std::vector<Business::Enemy> _enemies;
		std::vector<Business::SpikeTrap> _traps;
		Business::Boss _boss;
		QString _theme;
		QVariantList _walls;
		QVariantList _decor;
		QString _deathMessage;
		int _number;
		uint32_t _seed;
		int _exitX;
		int _exitY;
		bool _onExit;
		bool _dead;
		bool _hasBoss;
		double _pitch;
	};
}
