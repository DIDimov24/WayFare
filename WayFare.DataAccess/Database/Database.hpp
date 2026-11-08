#pragma once

namespace WayFare::DataAccess {
	class Database {
	public:
		Database();
		~Database();

		bool isConnected() const;

	private:
		bool _connected;
	};
}
