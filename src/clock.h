#ifndef CLOCK_H
#define CLOCK_H

#include <QObject>

class Clock : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool darkTheme READ darkTheme WRITE setDarkTheme NOTIFY darkThemeChanged)
    Q_PROPERTY(QString watchFace READ watchFace WRITE setWatchFace NOTIFY watchFaceChanged)
public:
    explicit Clock(QObject *parent = 0);

    bool darkTheme() const;
    void setDarkTheme(bool darkTheme);

    QString watchFace() const;
    void setWatchFace(const QString &watchFace);

signals:
    void darkThemeChanged();
    void watchFaceChanged();

private:
    QString m_watchFace;
    bool m_darkTheme;
};

#endif // CLOCK_H
