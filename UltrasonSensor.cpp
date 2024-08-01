#include "UltrasonSensor.h"
#include <QtMath>
#include <QDebug>

UltrasonSensor::UltrasonSensor(QObject *parent)
    : QObject(parent), m_avantDroit(0.5), // Valeur initiale pour Avant Droit
    m_avantGauche(1.0), // Valeur initiale pour Avant Gauche
    m_arriereDroit(6.0), // Valeur initiale pour Arrière Droit
    m_arriereGauche(5.0), // Valeur initiale pour Arrière Gauche
    m_coteDroit(0.3), // Valeur initiale pour Côté Droit
    m_coteGauche(1.5) // Valeur initiale pour Côté Gauche
{
    m_serialPort = new QSerialPort(this);
    m_serialPort->setPortName("/dev/ttyUSB0"); // Remplacez par le port correct
    m_serialPort->setBaudRate(QSerialPort::Baud9600);
    m_serialPort->setDataBits(QSerialPort::Data8);
    m_serialPort->setParity(QSerialPort::NoParity);
    m_serialPort->setStopBits(QSerialPort::OneStop);
    m_serialPort->setFlowControl(QSerialPort::NoFlowControl);

    connect(m_serialPort, &QSerialPort::readyRead, this, &UltrasonSensor::readSerialData);

    if (!m_serialPort->open(QIODevice::ReadOnly)) {
        qDebug() << "Failed to open port" << m_serialPort->portName() << ", error:" << m_serialPort->errorString();
    }
    else {
        qDebug() << "Port ouvert avec succès" << m_serialPort->portName();
    }

}
void UltrasonSensor::readSerialData()
{
    while (m_serialPort->canReadLine()) {
        QByteArray line = m_serialPort->readLine().trimmed();
        qDebug() << "Received line:" << line; // Debugging line

        // Vérifiez si la ligne contient les informations attendues
        if (line.startsWith("Distance 1:")) {
            bool ok;
            double distance1 = line.split(':')[1].trimmed().split(' ')[0].toDouble(&ok);
            if (ok) {
                qDebug() << distance1; // Debugging line
                setAvantDroit(distance1);
                setAvantGauche(distance1);
            }
        }
        else if (line.startsWith("Distance 2:")) {
            bool ok;
            double distance2 = line.split(':')[1].trimmed().split(' ')[0].toDouble(&ok);
            if (ok) {
                qDebug() << distance2; // Debugging line
                setArriereDroit(distance2);
                setArriereGauche(distance2);
            }
        }
        else if (line.startsWith("Distance 3:")) {
            bool ok;
            double distance3 = line.split(':')[1].trimmed().split(' ')[0].toDouble(&ok);
            if (ok) {
                qDebug() << distance3; // Debugging line
                setCoteDroit(distance3);
                setCoteGauche(distance3);
            }
        }
    }
}


double UltrasonSensor::avantDroit() const { return m_avantDroit; }
void UltrasonSensor::setAvantDroit(double distance) {
    if (qFabs(m_avantDroit - distance) > 1e-6) {
        m_avantDroit = distance;
        //updateCouleurEtIntensite();
        emit avantDroitChanged();
    }
}

double UltrasonSensor::avantGauche() const { return m_avantGauche; }
void UltrasonSensor::setAvantGauche(double distance) {
    if (qFabs(m_avantGauche - distance) > 1e-6) {
        m_avantGauche = distance;
        //updateCouleurEtIntensite();
        emit avantGaucheChanged();
    }
}

double UltrasonSensor::arriereDroit() const { return m_arriereDroit; }
void UltrasonSensor::setArriereDroit(double distance) {
    if (qFabs(m_arriereDroit - distance) > 1e-6) {
        m_arriereDroit = distance;
        //updateCouleurEtIntensite();
        emit arriereDroitChanged();
    }
}

double UltrasonSensor::arriereGauche() const { return m_arriereGauche; }
void UltrasonSensor::setArriereGauche(double distance) {
    if (qFabs(m_arriereGauche - distance) > 1e-6) {
        m_arriereGauche = distance;
        //updateCouleurEtIntensite();
        emit arriereGaucheChanged();
    }
}

double UltrasonSensor::coteDroit() const { return m_coteDroit; }
void UltrasonSensor::setCoteDroit(double distance) {
    if (qFabs(m_coteDroit - distance) > 1e-6) {
        m_coteDroit = distance;
        //updateCouleurEtIntensite();
        emit coteDroitChanged();
    }
}

double UltrasonSensor::coteGauche() const { return m_coteGauche; }
void UltrasonSensor::setCoteGauche(double distance) {
    if (qFabs(m_coteGauche - distance) > 1e-6) {
        m_coteGauche = distance;
        //updateCouleurEtIntensite();
        emit coteGaucheChanged();
    }
}
// void UltrasonSensor::updateCouleurEtIntensite()
// {
//     auto updateSensor = [this](double distance, QColor &couleur, double &intensite) {
//         if (distance < 1) {
//             couleur = Qt::red;
//             intensite = 1.0;
//         } else if (distance < 2) {
//             couleur = QColor(255, 165, 0);  // Définissez manuellement l'orange (255, 165, 0)
//             intensite = 0.5;
//         } else {
//             couleur = Qt::green;
//             intensite = 0.1;
//         }
//     };

// updateSensor(m_avantDroit, m_couleurAvantDroit, m_intensiteAvantDroit);
// updateSensor(m_avantGauche, m_couleurAvantGauche, m_intensiteAvantGauche);
// updateSensor(m_arriereDroit, m_couleurArriereDroit, m_intensiteArriereDroit);
// updateSensor(m_arriereGauche, m_couleurArriereGauche, m_intensiteArriereGauche);
// updateSensor(m_coteDroit, m_couleurCoteDroit, m_intensiteCoteDroit);
// updateSensor(m_coteGauche, m_couleurCoteGauche, m_intensiteCoteGauche);

// emit couleurAvantDroitChanged();
// emit couleurAvantGaucheChanged();
// emit couleurArriereDroitChanged();
// emit couleurArriereGaucheChanged();
// emit couleurCoteDroitChanged();
// emit couleurCoteGaucheChanged();
// emit intensiteAvantDroitChanged();
// emit intensiteAvantGaucheChanged();
// emit intensiteArriereDroitChanged();
// emit intensiteArriereGaucheChanged();
// emit intensiteCoteDroitChanged();
// emit intensiteCoteGaucheChanged();
//}

// QColor UltrasonSensor::couleurAvantDroit() const {
//     return m_couleurAvantDroit;
// }

// QColor UltrasonSensor::couleurAvantGauche() const {
//     return m_couleurAvantGauche;
// }

// QColor UltrasonSensor::couleurArriereDroit() const {
//     return m_couleurArriereDroit;
// }

// QColor UltrasonSensor::couleurArriereGauche() const {
//     return m_couleurArriereGauche;
// }

// QColor UltrasonSensor::couleurCoteDroit() const {
//     return m_couleurCoteDroit;
// }

// QColor UltrasonSensor::couleurCoteGauche() const {
//     return m_couleurCoteGauche;
// }

// double UltrasonSensor::intensiteAvantDroit() const {
//     return m_intensiteAvantDroit;
// }

// double UltrasonSensor::intensiteAvantGauche() const {
//     return m_intensiteAvantGauche;
// }

// double UltrasonSensor::intensiteArriereDroit() const {
//     return m_intensiteArriereDroit;
// }

// double UltrasonSensor::intensiteArriereGauche() const {
//     return m_intensiteArriereGauche;
// }

// double UltrasonSensor::intensiteCoteDroit() const {
//     return m_intensiteCoteDroit;
// }

// double UltrasonSensor::intensiteCoteGauche() const {
//     return m_intensiteCoteGauche;
// }
