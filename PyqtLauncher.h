#ifndef PYQTLAUNCHER_H
#define PYQTLAUNCHER_H

#include <QObject>

class PyQtLauncher : public QObject
{
    Q_OBJECT
public:
    explicit PyQtLauncher(QObject *parent = nullptr);

public slots:
    void launchPyQtAppPanelDetection();
    void launchPyQtAppPersonDetection();

};

#endif // PYQTLAUNCHER_H
