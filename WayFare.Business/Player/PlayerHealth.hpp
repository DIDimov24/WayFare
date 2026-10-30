#pragma once

#include "WayFare.Business/models/Player.hpp"

namespace WayFare::Business {
	const int maxPlayerHealth = 8;
	const double playerInvincibilityDuration = 1.0;

	DamageStatus damagePlayer(Player& player, int amount);

	void updatePlayerHealth(Player& player, double deltaTime);

	bool isPlayerDead(const Player& player);

	bool isPlayerInvincible(const Player& player);
}
