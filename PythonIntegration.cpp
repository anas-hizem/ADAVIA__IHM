#include "PythonIntegration.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>

PythonIntegration::PythonIntegration(QObject *parent) : QObject(parent)
{
    process.setProgram("python3");
    process.setArguments(QStringList() << "qrc:/PersonDetection/PersonDetection.py");

    connect(&process, &QProcess::readyReadStandardOutput, this, &PythonIntegration::handleReadyRead);
    process.start();
}

void PythonIntegration::handleReadyRead()
{
    QByteArray output = process.readAllStandardOutput();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(output);
    QJsonObject jsonObj = jsonDoc.object();

    int count = jsonObj["count"].toInt();
    emit personCountUpdated(count);
}
