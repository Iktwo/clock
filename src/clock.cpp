#include "clock.h"

#include <QSettings>

Clock::Clock(QObject *parent) :
    QObject(parent)
{
    QSettings settings;
    m_darkTheme = settings.value("darkTheme", true).toBool();
    m_watchFace = settings.value("watchFace", true).toString();
}

bool Clock::darkTheme() const
{
    return m_darkTheme;
}

void Clock::setDarkTheme(bool darkTheme)
{
    if (m_darkTheme == darkTheme)
        return;

    m_darkTheme = darkTheme;
    darkThemeChanged();

    QSettings settings;
    settings.setValue("darkTheme", m_darkTheme);
}

QString Clock::watchFace() const
{
    return m_watchFace;
}

void Clock::setWatchFace(const QString &watchFace)
{
    if (m_watchFace == watchFace)
        return;

    m_watchFace = watchFace;
    watchFaceChanged();

    QSettings settings;
    settings.setValue("watchFace", m_watchFace);
}
