#ifndef PYTHONINTEGRATION_H
#define PYTHONINTEGRATION_H

#include <QObject>
#include <QProcess>

class PythonIntegration : public QObject
{
    Q_OBJECT

public:
    PythonIntegration(QObject *parent = nullptr);

signals:
    void personCountUpdated(int count);

private slots:
    void handleReadyRead();

private:
    QProcess process;
};

#endif // PYTHONINTEGRATION_H
