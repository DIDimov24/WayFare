#include "WayFare.DataAccess/Database/Database.hpp"

#include <QDebug>
#include <QDir>
#include <QFileInfo>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QString>
#include <QStringList>

namespace WayFare::DataAccess {
	QString databaseDataFolder() {
		QDir dir = QFileInfo(QString::fromUtf8(__FILE__)).absoluteDir();
		dir.cdUp();
		return dir.absoluteFilePath(QStringLiteral("data"));
	}

	bool createDatabaseTables() {
		QStringList statements = {
			QStringLiteral("CREATE TABLE IF NOT EXISTS saves ("
				"id INTEGER PRIMARY KEY CHECK (id = 1), "
				"level INTEGER NOT NULL, "
				"seed INTEGER NOT NULL, "
				"player_x REAL NOT NULL, "
				"player_y REAL NOT NULL, "
				"facing REAL NOT NULL, "
				"health INTEGER NOT NULL, "
				"potion_count INTEGER NOT NULL)"),
			QStringLiteral("CREATE TABLE IF NOT EXISTS save_items ("
				"position INTEGER PRIMARY KEY, "
				"item TEXT NOT NULL)"),
			QStringLiteral("CREATE TABLE IF NOT EXISTS settings ("
				"id INTEGER PRIMARY KEY CHECK (id = 1), "
				"sensitivity INTEGER NOT NULL, "
				"music_volume INTEGER NOT NULL, "
				"sfx_volume INTEGER NOT NULL)")
		};

		for (qsizetype i = 0; i < statements.size(); i++) {
			QSqlQuery query;

			if (!query.exec(statements[i])) {
				qWarning() << "Could not create table:" << query.lastError().text();
				return false;
			}
		}

		return true;
	}

	Database::Database() {
		QString folder = databaseDataFolder();
		QDir().mkpath(folder);
		QString path = QDir(folder).absoluteFilePath(QStringLiteral("WayFare.db"));

		QSqlDatabase database = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
		database.setDatabaseName(path);
		_connected = database.open() && createDatabaseTables();

		if (!_connected) {
			qWarning() << "Could not open database at:" << path << database.lastError().text();
		}
	}

	Database::~Database() {
		QSqlDatabase::database().close();
		QSqlDatabase::removeDatabase(QString::fromUtf8(QSqlDatabase::defaultConnection));
	}

	bool Database::isConnected() const {
		return _connected;
	}
}
