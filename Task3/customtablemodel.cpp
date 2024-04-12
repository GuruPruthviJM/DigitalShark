// customtablemodel.cpp
#include "customtablemodel.h"
#include <QDebug>
CustomTableModel::CustomTableModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int CustomTableModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_data.size();
}

QVariant CustomTableModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() < 0 || index.row() >= m_data.size())
        return QVariant();

    const QVariantMap &item = m_data.at(index.row()).toMap();
    switch (role) {
    case name:
        return item.value("Name");
    case password:
        return item.value("Password");
    case age:
        return item.value("Age");
    case gender:
        return item.value("Gender");
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CustomTableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[name] = "name";
    roles[password] = "password";
    roles[age] = "age";
    roles[gender] = "gender";
    return roles;
}


void CustomTableModel::addData(const QVariantMap &data)
{
    // qDebug() << "hii";
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_data.append(data);
    endInsertRows();
}

void CustomTableModel::clearData()
{
    beginResetModel();
    m_data.clear();
    endResetModel();
}

QVariantMap CustomTableModel::rowData(int row) const
{
    if (row < 0 || row >= m_data.size())
        return QVariantMap();
    return m_data[row].toMap();
}

bool CustomTableModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid())
        return false;
    int row = index.row();
    if (row < 0 || row >= m_data.size())
        return false;
    QVariantMap item = m_data[row].toMap();
    if (role == 0) {
        item["Name"] = value.toString();
    } else if (role == 1) {
        item["Password"] = value.toString();
    } else if (role == 2) {
        item["Age"] = value.toString();
    } else if (role == 3) {
        item["Gender"] = value.toString();
    } else {
        return false;
    }
    m_data[row] = item;
    // qDebug()<<m_data[row];
    emit dataChanged(index, index, QVector<int>() << role);
    return true;
}

