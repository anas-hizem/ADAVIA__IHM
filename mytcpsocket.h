#ifndef MYTCPSOCKET_H
#define MYTCPSOCKET_H

#include <QObject>
#include <QTcpSocket>
#include <QTcpServer>
#include <QDebug>

class MyTcpSocket : public QObject
{
    Q_OBJECT
public:
    explicit MyTcpSocket(QObject *parent = nullptr);

signals:
    void countReceived(int current , int entry , int exit); // Signal pour transmettre les données
    void objectReceived(QString className , double score);
public slots:
    void startServer();
    void newConnection();
    void readData();

private:
    QTcpServer *server;
    QTcpSocket *socket;
};

#endif // MYTCPSOCKET_H
