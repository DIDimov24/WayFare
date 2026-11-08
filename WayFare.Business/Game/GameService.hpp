#pragma once

#include "WayFare.Business/models/GameSettings.hpp"
#include "WayFare.Business/models/SavedGame.hpp"
#include "WayFare.DataAccess/SaveRepository/SaveRepository.hpp"
#include "WayFare.DataAccess/SettingsRepository/SettingsRepository.hpp"

namespace WayFare::Business {
	const int lastLevelNumber = 3;
	const int defaultSensitivity = 25;
	const int defaultMusicVolume = 100;
	const int defaultSfxVolume = 100;

	class GameService {
	public:
		GameService(DataAccess::SaveRepository& saves, DataAccess::SettingsRepository& settings);

		bool hasSave();
		SaveGameStatus saveGame(const SavedGame& game);
		LoadGameResponse loadGame();
		SaveGameStatus deleteSave();

		GameSettings loadSettings();
		SaveSettingsStatus saveSettings(const GameSettings& settings);

	private:
		DataAccess::SaveRepository& _saves;
		DataAccess::SettingsRepository& _settings;
	};
}
