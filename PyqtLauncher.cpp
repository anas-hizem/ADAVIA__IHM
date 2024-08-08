#include "PyqtLauncher.h"
#include <QProcess>
#include <QProcessEnvironment>
#include <QDebug>

PyQtLauncher::PyQtLauncher(QObject *parent) : QObject(parent)
{
}

void PyQtLauncher::launchPyQtAppPanelDetection()
{
    // Chemin vers votre script Python
    QString pythonExecutable = "/home/anas/DetectionNavette/myenv/bin/python3.12";
    QString pythonScript = "/home/anas/DetectionNavette/PyQtPanelDetection.py";

    QProcess process;



    // Configurer l'environnement du processus
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    env.insert("QT_QPA_PLATFORM_PLUGIN_PATH", "/home/anas/Qt/5.15.2/gcc_64/plugins");
    process.setProcessEnvironment(env);



    // Exécuter le script Python
    QProcess::startDetached(pythonExecutable, QStringList() << pythonScript);
}

void PyQtLauncher::launchPyQtAppPersonDetection()
{
    // Chemin vers votre script Python
    QString pythonExecutable = "/home/anas/DetectionNavette/myenv/bin/python3.12";
    QString pythonScript = "/home/anas/DetectionNavette/PyQtPersonDetection.py";

    QProcess process;



    // Configurer l'environnement du processus
    QProcessEnvironment env = QProcessEnvironment::systemEnvironment();
    env.insert("QT_QPA_PLATFORM_PLUGIN_PATH", "/home/anas/Qt/5.15.2/gcc_64/plugins");
    process.setProcessEnvironment(env);



    // Exécuter le script Python
    QProcess::startDetached(pythonExecutable, QStringList() << pythonScript);
}
