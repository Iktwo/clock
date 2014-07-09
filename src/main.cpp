#include <QApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "clock.h"
//#include "translator.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("Iktwo Corp.");
    QCoreApplication::setOrganizationDomain("iktwo.com");
    QCoreApplication::setApplicationName("Clock");

    QScopedPointer<QApplication> app(new QApplication(argc, argv));
    QQmlApplicationEngine engine;

    QObject::connect(&engine, &QQmlApplicationEngine::quit, &QCoreApplication::quit);

    /// Add translation files
//    Translator translator(app.data(), ":/translations/");
//    translator.addTranslation("SP", "translation_sp.qm");
//    engine.rootContext()->setContextProperty("translator", &translator);

    /// Retrieve last translation
//    QSettings settings;
//    translator.translate(settings.value("language", "SP").toString());

//    QQmlComponent component(&engine, QUrl("qrc:/qml/qml/main.qml"));
//    if (!component.isReady())
//        qWarning("%s", qPrintable(component.errorString()));

//    QObject *topLevel = component.create();

//    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

//    engine.setIncubationController(window->incubationController());

//    window->show();
    Clock clock;
    engine.rootContext()->setContextProperty(QStringLiteral("clock"), &clock);
    engine.load(QUrl(QStringLiteral("qrc:/qml/qml/main.qml")));

    return app->exec();
}
