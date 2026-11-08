#pragma once

#include "WayFare.Business/Game/GameService.hpp"

namespace WayFare::Presentation {
	inline constexpr const char* QmlModuleUri = "wayfare.presentation";

	void initialize(Business::GameService& gameService);
}
