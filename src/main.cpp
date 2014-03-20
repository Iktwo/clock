#include <QApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QSettings>

#include "translator.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("Iktwo Corp.");
    QCoreApplication::setOrganizationDomain("iktwo.com");
    QCoreApplication::setApplicationName("Inventario");

    QScopedPointer<QApplication> app(new QApplication(argc, argv));

    QQmlEngine engine;

    QObject::connect(&engine, &QQmlEngine::quit, &QCoreApplication::quit);

    /// Add translation files
    Translator translator(app.data(), ":/translations/");
    translator.addTranslation("SP", "translation_sp.qm");
    engine.rootContext()->setContextProperty("translator", &translator);

    /// Retrieve last translation
    QSettings settings;
    translator.translate(settings.value("language", "SP").toString());

    QQmlComponent component(&engine, QUrl("qrc:/qml/qml/main.qml"));
    if (!component.isReady())
        qWarning("%s", qPrintable(component.errorString()));

    QObject *topLevel = component.create();

    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    engine.setIncubationController(window->incubationController());

    window->show();

    return app->exec();
}
