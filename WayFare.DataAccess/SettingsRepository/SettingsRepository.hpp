#pragma once

#include "WayFare.DataAccess/Database/Database.hpp"
#include "WayFare.DataAccess/models/SettingsData.hpp"

namespace WayFare::DataAccess {
	class SettingsRepository {
	public:
		SettingsRepository(Database& database);

		SettingsStatus save(const SettingsData& settings);
		LoadSettingsResponse load();

	private:
		Database& _database;
	};
}
