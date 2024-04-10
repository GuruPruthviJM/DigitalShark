#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>
#include <QAbstractItemModel>
#include <QStandardItemModel>
class DatabaseManager : public QObject
{
    Q_OBJECT
public:
    explicit Q_INVOKABLE DatabaseManager(QObject *parent = nullptr);
    Q_INVOKABLE void initializeDatabase();
    Q_INVOKABLE void insertData(QString namePerson, QString passwordPerson, QString agePerson, QString genderPerson);
    Q_INVOKABLE QVariantList fetchData();
    Q_INVOKABLE QVariantList fetchDataP(int rowId);
    Q_INVOKABLE bool verifyLogin(const QString &name, const QString &password);
    Q_INVOKABLE bool deleteRow(int rowid);
    Q_INVOKABLE void updateData(int row1, const QString &namePerson, const QString &passwordPerson, const QString &agePerson, const QString &genderPerson);

private:
    QSqlDatabase m_database;
};

#endif
