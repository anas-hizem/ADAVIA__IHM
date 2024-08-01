#ifndef CAMERASTREAMING_H
#define CAMERASTREAMING_H

#include <QObject>
#include <QScopedPointer>
#include <QCamera>

class CameraStreaming : public QObject
{
    Q_OBJECT

public:
    CameraStreaming();

public slots:
    void start_Camera();
    void stop_Camera();

private:
    QScopedPointer<QCamera> m_camera;
};

#endif // CAMERASTREAMING_H
