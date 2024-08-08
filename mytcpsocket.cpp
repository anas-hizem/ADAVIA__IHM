#include "mytcpsocket.h"
#include <QJsonDocument>
#include <QJsonObject>

MyTcpSocket::MyTcpSocket(QObject *parent) : QObject(parent), server(new QTcpServer(this)), socket(nullptr)
{
    connect(server, &QTcpServer::newConnection, this, &MyTcpSocket::newConnection);
}

void MyTcpSocket::startServer()
{
    if (!server->listen(QHostAddress::Any, 65432)) {
        qDebug() << "Server error: " << server->errorString();
        return;
    }
    qDebug() << "Server started...";
}

void MyTcpSocket::newConnection()
{
    socket = server->nextPendingConnection();
    connect(socket, &QTcpSocket::readyRead, this, &MyTcpSocket::readData);
    connect(socket, &QTcpSocket::disconnected, socket, &QTcpSocket::deleteLater);
}

void MyTcpSocket::readData()
{
    QByteArray data = socket->readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(data);
    QJsonObject jsonObj = jsonDoc.object();



    if (jsonObj.contains("person")) {
        QJsonObject personObj = jsonObj["person"].toObject();
        int current = personObj["current"].toInt();
        int entry = personObj["entry"].toInt();
        int exit = personObj["exit"].toInt();
        qDebug() << "current number:" << current << "entry number:" << entry << "exit number:" << exit ;
        emit countReceived(current, entry, exit);
    }

    if (jsonObj.contains("object")) {
        QJsonObject obj = jsonObj["object"].toObject();
        QString className = obj["class"].toString();
        double score = obj["score"].toDouble();
        //QString object = QString("%1: %2").arg(className).arg(score);

        //qDebug() << "Received object:" << className << score;
        emit objectReceived(className , score);
    }
}
