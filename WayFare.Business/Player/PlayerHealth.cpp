#include "WayFare.Business/Player/PlayerHealth.hpp"

namespace WayFare::Business {
	DamageStatus damagePlayer(Player& player, int amount) {
		if (amount <= 0 || isPlayerDead(player)) {
			return DamageStatus::Failure;
		}

		if (isPlayerInvincible(player)) {
			return DamageStatus::Invincible;
		}

		player.health = player.health - amount;

		if (player.health <= 0) {
			player.health = 0;
			player.invincibilityTime = 0.0;
			return DamageStatus::Died;
		}

		player.invincibilityTime = playerInvincibilityDuration;
		return DamageStatus::Success;
	}

	void updatePlayerHealth(Player& player, double deltaTime) {
		player.invincibilityTime = player.invincibilityTime - deltaTime;

		if (player.invincibilityTime < 0.0) {
			player.invincibilityTime = 0.0;
		}
	}

	bool isPlayerDead(const Player& player) {
		return player.health <= 0;
	}

	bool isPlayerInvincible(const Player& player) {
		return player.invincibilityTime > 0.0;
	}
}
