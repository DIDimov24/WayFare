#include "WayFare.DataAccess/SettingsRepository/SettingsRepository.hpp"

#include <QSqlQuery>
#include <QString>
#include <QVariant>

namespace WayFare::DataAccess {
	SettingsRepository::SettingsRepository(Database& database) : _database(database) {}

	SettingsStatus SettingsRepository::save(const SettingsData& settings) {
		if (!_database.isConnected()) {
			return SettingsStatus::Failure;
		}

		QSqlQuery query;
		query.prepare(QStringLiteral("INSERT OR REPLACE INTO settings (id, sensitivity, music_volume, sfx_volume) VALUES (1, ?, ?, ?)"));
		query.addBindValue(settings.sensitivity);
		query.addBindValue(settings.musicVolume);
		query.addBindValue(settings.sfxVolume);

		if (!query.exec()) {
			return SettingsStatus::Failure;
		}
		return SettingsStatus::Success;
	}

	LoadSettingsResponse SettingsRepository::load() {
		if (!_database.isConnected()) {
			return { .success = false, .errorMessage = "Database is not connected.", .settings = {} };
		}

		QSqlQuery query;
		query.prepare(QStringLiteral("SELECT sensitivity, music_volume, sfx_volume FROM settings WHERE id = 1"));
		if (!query.exec()) {
			return { .success = false, .errorMessage = "Failed to load the settings.", .settings = {} };
		}

		if (!query.next()) {
			return { .success = false, .errorMessage = "No saved settings.", .settings = {} };
		}

		SettingsData settings;
		settings.sensitivity = query.value(0).toInt();
		settings.musicVolume = query.value(1).toInt();
		settings.sfxVolume = query.value(2).toInt();

		return { .success = true, .errorMessage = "", .settings = settings };
	}
}
