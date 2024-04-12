// customtablemodel.h
#ifndef CUSTOMTABLEMODEL_H
#define CUSTOMTABLEMODEL_H

#include <QAbstractListModel>
#include <QVariantList>
#include <QHash>
struct MyListItem
{
    QString name;
    QString password;
    QString age;
    QString gender;
    int id;
};
class CustomTableModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit CustomTableModel(QObject *parent = nullptr);

    enum {
        name = Qt::UserRole,
        password,
        age,
        gender,
        id
    };

    Q_INVOKABLE int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QHash<int, QByteArray> roleNames() const override;
    Q_INVOKABLE void addData(const QVariantMap &data);
    Q_INVOKABLE void clearData();
    Q_INVOKABLE QVariantMap rowData(int row) const;
   /* Q_INVOKABLE*/ bool setData(const QModelIndex &index, const QVariant &value, int role) override;
private:
    QVariantList m_data;
};

#endif
