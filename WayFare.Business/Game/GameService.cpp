#include "WayFare.Business/Game/GameService.hpp"

#include <string>
#include <vector>

#include "WayFare.Business/Inventory/Inventory.hpp"
#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	std::string gameServiceItemName(ItemType type) {
		if (type == ItemType::DivingGear) {
			return "diving_gear";
		}
		if (type == ItemType::Sword) {
			return "sword";
		}
		if (type == ItemType::Pistol) {
			return "pistol";
		}
		return "potion";
	}

	bool gameServiceParseItem(const std::string& name, ItemType& type) {
		if (name == "diving_gear") {
			type = ItemType::DivingGear;
			return true;
		}
		if (name == "sword") {
			type = ItemType::Sword;
			return true;
		}
		if (name == "pistol") {
			type = ItemType::Pistol;
			return true;
		}
		return false;
	}

	int gameServiceClamp(int value, int low, int high) {
		if (value < low) {
			return low;
		}
		if (value > high) {
			return high;
		}
		return value;
	}

	GameService::GameService(DataAccess::SaveRepository& saves, DataAccess::SettingsRepository& settings) : _saves(saves), _settings(settings) {}

	bool GameService::hasSave() {
		return loadGame().success;
	}

	SaveGameStatus GameService::saveGame(const SavedGame& game) {
		if (game.level < 1 || game.level > lastLevelNumber || isPlayerDead(game.player)) {
			return SaveGameStatus::Failure;
		}

		DataAccess::SaveData save;
		save.level = game.level;
		save.seed = game.seed;
		save.playerX = game.player.x;
		save.playerY = game.player.y;
		save.facing = game.player.facing;
		save.health = game.player.health;
		save.potionCount = game.inventory.potionCount;
		for (size_t i = 0; i < game.inventory.items.size(); i++) {
			if (game.inventory.items[i] != ItemType::Potion) {
				save.items.push_back(gameServiceItemName(game.inventory.items[i]));
			}
		}

		if (_saves.save(save) != DataAccess::SaveStatus::Success) {
			return SaveGameStatus::Failure;
		}
		return SaveGameStatus::Success;
	}

	LoadGameResponse GameService::loadGame() {
		DataAccess::LoadSaveResponse response = _saves.load();
		if (!response.success) {
			return { .success = false, .errorMessage = response.errorMessage, .game = {} };
		}

		DataAccess::SaveData save = response.save;
		if (save.level < 1 || save.level > lastLevelNumber) {
			return { .success = false, .errorMessage = "The save has an unknown level.", .game = {} };
		}
		if (save.health < 1 || save.health > maxPlayerHealth || save.potionCount < 0) {
			return { .success = false, .errorMessage = "The save has invalid player data.", .game = {} };
		}

		SavedGame game;
		game.level = save.level;
		game.seed = save.seed;
		game.player = { save.playerX, save.playerY, save.facing, save.health, 0.0 };
		game.inventory = createInventory();
		game.inventory.potionCount = save.potionCount;
		for (size_t i = 0; i < save.items.size(); i++) {
			ItemType type = ItemType::Potion;
			if (!gameServiceParseItem(save.items[i], type)) {
				return { .success = false, .errorMessage = "The save has an unknown item.", .game = {} };
			}
			addItem(game.inventory, type);
		}

		return { .success = true, .errorMessage = "", .game = game };
	}

	SaveGameStatus GameService::deleteSave() {
		if (_saves.remove() != DataAccess::SaveStatus::Success) {
			return SaveGameStatus::Failure;
		}
		return SaveGameStatus::Success;
	}

	GameSettings GameService::loadSettings() {
		GameSettings settings = { defaultSensitivity, defaultMusicVolume, defaultSfxVolume };
		DataAccess::LoadSettingsResponse response = _settings.load();
		if (!response.success) {
			return settings;
		}

		settings.sensitivity = gameServiceClamp(response.settings.sensitivity, 1, 100);
		settings.musicVolume = gameServiceClamp(response.settings.musicVolume, 0, 100);
		settings.sfxVolume = gameServiceClamp(response.settings.sfxVolume, 0, 100);
		return settings;
	}

	SaveSettingsStatus GameService::saveSettings(const GameSettings& settings) {
		DataAccess::SettingsData data;
		data.sensitivity = gameServiceClamp(settings.sensitivity, 1, 100);
		data.musicVolume = gameServiceClamp(settings.musicVolume, 0, 100);
		data.sfxVolume = gameServiceClamp(settings.sfxVolume, 0, 100);

		if (_settings.save(data) != DataAccess::SettingsStatus::Success) {
			return SaveSettingsStatus::Failure;
		}
		return SaveSettingsStatus::Success;
	}
}
