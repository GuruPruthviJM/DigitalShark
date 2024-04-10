#include "customlistmodel.h"

CustomListModel::CustomListModel(QObject *parent) : QAbstractListModel(parent) {}

int CustomListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent)
    return m_data.count();
}

QVariant CustomListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_data.count())
        return QVariant();

    const QVariantMap &item = m_data[index.row()];
    if (role == Qt::DisplayRole) {
        // Customize this to return the data you want to display in the table view
        // For example, to display the name:
        return item.value("Name");
    }

    return QVariant();
}

void CustomListModel::appendData(const QVariantMap &data) {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_data.append(data);
    endInsertRows();
}

void CustomListModel::updateData(int row, const QVariantMap &data) {
    if (row < 0 || row >= m_data.count())
        return;

    m_data[row] = data;
    QModelIndex index = createIndex(row, 0);
    emit dataChanged(index, index);
}

void CustomListModel::removeData(int row) {
    if (row < 0 || row >= m_data.count())
        return;

    beginRemoveRows(QModelIndex(), row, row);
    m_data.removeAt(row);
    endRemoveRows();
}
