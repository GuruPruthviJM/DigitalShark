// databasemanager.cpp
#include "databasemanager.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QStandardItem>
#include <QAbstractItemModel>
#include <QStandardItemModel>
#include <QStandardItem>


DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent) {}

void DatabaseManager::initializeDatabase() {
    m_database = QSqlDatabase::addDatabase("QSQLITE");
    m_database.setDatabaseName("task31.db");
    if (!m_database.open()) {
        qWarning() << "Error: could not open database" << m_database.lastError().text();
        return;
    } else {
        qDebug() << "Database opened successfully";
    }
    QSqlQuery query(m_database);
    if (!query.exec("CREATE TABLE IF NOT EXISTS Register("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "Name TEXT, "
                    "Password TEXT, "
                    "Age TEXT, "
                    "Gender TEXT)")) {
        qWarning() << "Error: could not create table" << query.lastError().text();
    } else {
        qDebug() << "Table created successfully";
    }
}


void DatabaseManager::insertData(QString namePerson, QString passwordPerson, QString agePerson, QString genderPerson) {
    if (!m_database.isOpen()) {
        qWarning() << "Error: database not open";
        return;
    }
    QSqlQuery query(m_database);
    QString queryString = QString("INSERT INTO Register (Name, Password, Age, Gender) VALUES ('%1','%2','%3','%4')").arg(namePerson, passwordPerson, agePerson, genderPerson);
    if (!query.exec(queryString)) {
        qWarning() << "Error: could not insert data" << query.lastError().text();
    } else {
        qDebug() << "Data is added";
    }
}

QVariantList DatabaseManager::fetchData() {
    QVariantList result;
    if (!m_database.isOpen()) {
        qWarning() << "Error: database not open";
        return result;
    }
    QSqlQuery query(m_database);
    if (!query.exec("SELECT * FROM Register")) {
        qWarning() << "Error: could not fetch data" << query.lastError().text();
        return result;
    }

    while (query.next()) {
        QVariantMap row;
        row["id"] = query.value("id").toInt(); // Renaming "rowid" to "id"
        row["Name"] = query.value("Name").toString();
        row["Password"] = query.value("Password").toString();
        row["Age"] = query.value("Age").toString();
        row["Gender"] = query.value("Gender").toString();
        result.append(row);
    }

    return result;
}

QVariantList DatabaseManager::fetchDataP(int rowId) {
    QVariantList result;
    if (!m_database.isOpen()) {
        qWarning() << "Error: database not open";
        return result;
    }
    QSqlQuery query(m_database);
    query.prepare("SELECT * FROM Register WHERE id = ?");
    query.addBindValue(rowId);
    if (!query.exec()) {
        qWarning() << "Error: could not fetch data" << query.lastError().text();
        return result;
    }else{
        qDebug() <<"fetched";
    }
    while (query.next()) {
        QVariantMap row;
        row["id"] = query.value("id").toInt(); // Renaming "rowid" to "id"
        row["Name"] = query.value("Name").toString();
        row["Password"] = query.value("Password").toString();
        row["Age"] = query.value("Age").toString();
        row["Gender"] = query.value("Gender").toString();
        result.append(row);
    }

    return result;
}



bool DatabaseManager::verifyLogin(const QString &name, const QString &password) {
    if (!m_database.isOpen()) {
        qWarning() << "Error: database not open";
        return false;
    }
    QSqlQuery query(m_database);
    query.prepare("SELECT * FROM Register WHERE Name = :name AND Password = :password");
    query.bindValue(":name", name);
    query.bindValue(":password", password);
    if (!query.exec()) {
        qWarning() << "Error: could not verify login" << query.lastError().text();
        return false;
    }
    return query.next();
}

bool DatabaseManager::deleteRow(int rowid) {
    if (!m_database.isOpen()) {
        qWarning() << "Error: database not open";
        return false;
    }
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM Register WHERE id = ?");
    query.addBindValue(rowid);
    if (!query.exec()) {
        qWarning() << "Error: could not delete row" << query.lastError().text();
        return false;
    }
    return true;
}

void DatabaseManager::updateData(int row1, const QString &namePerson, const QString &passwordPerson, const QString &agePerson, const QString &genderPerson) {
    if (!m_database.isOpen()) {
        qWarning() << "Error: database not open";
        return;
    }
    QSqlQuery query(m_database);
    query.prepare("UPDATE Register SET Name = :name, Password = :password, Age = :age, Gender = :gender WHERE id = :row");
    query.bindValue(":name", namePerson);
    query.bindValue(":password", passwordPerson);
    query.bindValue(":age", agePerson);
    query.bindValue(":gender", genderPerson);
    query.bindValue(":row", row1);
    if (!query.exec()) {
        qWarning() << "Error: could not update data" << query.lastError().text();
    } else {
        qDebug() << "Data is updated";
    }
}




