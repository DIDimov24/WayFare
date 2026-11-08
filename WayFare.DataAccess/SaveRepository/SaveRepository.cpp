#include "WayFare.DataAccess/SaveRepository/SaveRepository.hpp"

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QVariant>

namespace WayFare::DataAccess {
	SaveStatus saveRepositoryRollback() {
		QSqlDatabase::database().rollback();
		return SaveStatus::Failure;
	}

	SaveRepository::SaveRepository(Database& database) : _database(database) {}

	SaveStatus SaveRepository::save(const SaveData& save) {
		if (!_database.isConnected()) {
			return SaveStatus::Failure;
		}

		QSqlDatabase database = QSqlDatabase::database();
		if (!database.transaction()) {
			return SaveStatus::Failure;
		}

		QSqlQuery query;
		query.prepare(QStringLiteral(
			"INSERT OR REPLACE INTO saves (id, level, seed, player_x, player_y, facing, health, potion_count) "
			"VALUES (1, ?, ?, ?, ?, ?, ?, ?)"));
		query.addBindValue(save.level);
		query.addBindValue(qlonglong(save.seed));
		query.addBindValue(save.playerX);
		query.addBindValue(save.playerY);
		query.addBindValue(save.facing);
		query.addBindValue(save.health);
		query.addBindValue(save.potionCount);
		if (!query.exec()) {
			return saveRepositoryRollback();
		}

		QSqlQuery clearItems;
		if (!clearItems.exec(QStringLiteral("DELETE FROM save_items"))) {
			return saveRepositoryRollback();
		}

		for (size_t i = 0; i < save.items.size(); i++) {
			QSqlQuery item;
			item.prepare(QStringLiteral("INSERT INTO save_items (position, item) VALUES (?, ?)"));
			item.addBindValue(int(i));
			item.addBindValue(QString::fromStdString(save.items[i]));
			if (!item.exec()) {
				return saveRepositoryRollback();
			}
		}

		if (!database.commit()) {
			return saveRepositoryRollback();
		}
		return SaveStatus::Success;
	}

	LoadSaveResponse SaveRepository::load() {
		if (!_database.isConnected()) {
			return { .success = false, .errorMessage = "Database is not connected.", .save = {} };
		}

		QSqlQuery query;
		query.prepare(QStringLiteral(
			"SELECT level, seed, player_x, player_y, facing, health, potion_count FROM saves WHERE id = 1"));
		if (!query.exec()) {
			return { .success = false, .errorMessage = "Failed to load the game.", .save = {} };
		}

		if (!query.next()) {
			return { .success = false, .errorMessage = "No saved game.", .save = {} };
		}

		SaveData save;
		save.level = query.value(0).toInt();
		save.seed = uint32_t(query.value(1).toLongLong());
		save.playerX = query.value(2).toDouble();
		save.playerY = query.value(3).toDouble();
		save.facing = query.value(4).toDouble();
		save.health = query.value(5).toInt();
		save.potionCount = query.value(6).toInt();

		QSqlQuery items;
		items.prepare(QStringLiteral("SELECT item FROM save_items ORDER BY position"));
		if (!items.exec()) {
			return { .success = false, .errorMessage = "Failed to load the inventory.", .save = {} };
		}

		while (items.next()) {
			save.items.push_back(items.value(0).toString().toStdString());
		}

		return { .success = true, .errorMessage = "", .save = save };
	}

	bool SaveRepository::hasSave() {
		if (!_database.isConnected()) {
			return false;
		}

		QSqlQuery query;
		query.prepare(QStringLiteral("SELECT 1 FROM saves WHERE id = 1"));
		return query.exec() && query.next();
	}

	SaveStatus SaveRepository::remove() {
		if (!_database.isConnected()) {
			return SaveStatus::Failure;
		}

		QSqlDatabase database = QSqlDatabase::database();
		if (!database.transaction()) {
			return SaveStatus::Failure;
		}

		QSqlQuery save;
		QSqlQuery items;
		if (!save.exec(QStringLiteral("DELETE FROM saves")) || !items.exec(QStringLiteral("DELETE FROM save_items"))) {
			return saveRepositoryRollback();
		}

		if (!database.commit()) {
			return saveRepositoryRollback();
		}
		return SaveStatus::Success;
	}
}
