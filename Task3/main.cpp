#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databasemanager.h"
#include "customtablemodel.h" // Include the header file for CustomTableModel

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // Registering DatabaseManager class
    DatabaseManager databaseManager;
    engine.rootContext()->setContextProperty("databaseManager", &databaseManager);
    // Registering CustomTableModel class
    qmlRegisterType<CustomTableModel>("CustomTypes", 1, 0, "CustomTableModel");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
