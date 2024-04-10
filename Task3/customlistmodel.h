#ifndef CUSTOMLISTMODEL_H
#define CUSTOMLISTMODEL_H

#include <QAbstractListModel>
#include <QList>
#include <QVariantMap>

class CustomListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit CustomListModel(QObject *parent = nullptr);

    // QAbstractListModel overrides
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Custom methods to interact with the model
    void appendData(const QVariantMap &data);
    void updateData(int row, const QVariantMap &data);
    void removeData(int row);

private:
    QList<QVariantMap> m_data;
};

#endif // CUSTOMLISTMODEL_H
