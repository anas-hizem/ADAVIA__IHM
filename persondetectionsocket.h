#ifndef PERSONDETECTIONS_SOCKET_H
#define PERSONDETECTIONS_SOCKET_H

#include <QObject>
#include <QTcpSocket>

class PersonDetectionSocket : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)

public:
    explicit PersonDetectionSocket(QObject *parent = nullptr);
    int count() const;

signals:
    void countChanged();

private slots:
    void onReadyRead();
    void onError(QAbstractSocket::SocketError socketError);

private:
    void setupSocket();

    QTcpSocket *socket;
    int m_count;
};

#endif // PERSONDETECTIONS_SOCKET_H
