#include "PersonDetectionSocket.h"
#include <QTcpSocket>
#include <QJsonDocument>
#include <QJsonObject>

PersonDetectionSocket::PersonDetectionSocket(QObject *parent)
    : QObject(parent), socket(new QTcpSocket(this)), m_count(0)
{
    setupSocket();
}

int PersonDetectionSocket::count() const
{
    return m_count;
}

void PersonDetectionSocket::setupSocket()
{
    socket->connectToHost("localhost", 65432);
    connect(socket, &QTcpSocket::readyRead, this, &PersonDetectionSocket::onReadyRead);
    connect(socket, QOverload<QAbstractSocket::SocketError>::of(&QTcpSocket::error), this, &PersonDetectionSocket::onError);
}

void PersonDetectionSocket::onReadyRead()
{
    QByteArray data = socket->readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(data);
    QJsonObject jsonObj = jsonDoc.object();
    m_count = jsonObj["count"].toInt();
    emit countChanged();
}

void PersonDetectionSocket::onError(QAbstractSocket::SocketError socketError)
{
    qWarning() << "Socket error:" << socket->errorString();
}
