#include "camerastreaming.h"

CameraStreaming::CameraStreaming()
{
    m_camera.reset(new QCamera);
}

void CameraStreaming::start_Camera()
{
    if (m_camera)
        m_camera->start();
}

void CameraStreaming::stop_Camera()
{
    if (m_camera)
        m_camera->stop();
}
