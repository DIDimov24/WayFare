#pragma once

#include "WayFare.DataAccess/Database/Database.hpp"
#include "WayFare.DataAccess/models/SaveData.hpp"

namespace WayFare::DataAccess {
	class SaveRepository {
	public:
		SaveRepository(Database& database);

		SaveStatus save(const SaveData& save);
		LoadSaveResponse load();
		bool hasSave();
		SaveStatus remove();

	private:
		Database& _database;
	};
}
