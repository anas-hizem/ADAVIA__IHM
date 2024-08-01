#ifndef ULTRASONSENSOR_H
#define ULTRASONSENSOR_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QColor>


class UltrasonSensor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double avantDroit READ avantDroit WRITE setAvantDroit NOTIFY avantDroitChanged)
    Q_PROPERTY(double avantGauche READ avantGauche WRITE setAvantGauche NOTIFY avantGaucheChanged)
    Q_PROPERTY(double arriereDroit READ arriereDroit WRITE setArriereDroit NOTIFY arriereDroitChanged)
    Q_PROPERTY(double arriereGauche READ arriereGauche WRITE setArriereGauche NOTIFY arriereGaucheChanged)
    Q_PROPERTY(double coteDroit READ coteDroit WRITE setCoteDroit NOTIFY coteDroitChanged)
    Q_PROPERTY(double coteGauche READ coteGauche WRITE setCoteGauche NOTIFY coteGaucheChanged)
    // Q_PROPERTY(QColor couleurAvantDroit READ couleurAvantDroit NOTIFY couleurAvantDroitChanged)
    // Q_PROPERTY(QColor couleurAvantGauche READ couleurAvantGauche NOTIFY couleurAvantGaucheChanged)
    // Q_PROPERTY(QColor couleurArriereDroit READ couleurArriereDroit NOTIFY couleurArriereDroitChanged)
    // Q_PROPERTY(QColor couleurArriereGauche READ couleurArriereGauche NOTIFY couleurArriereGaucheChanged)
    // Q_PROPERTY(QColor couleurCoteDroit READ couleurCoteDroit NOTIFY couleurCoteDroitChanged)
    // Q_PROPERTY(QColor couleurCoteGauche READ couleurCoteGauche NOTIFY couleurCoteGaucheChanged)
    // Q_PROPERTY(double intensiteAvantDroit READ intensiteAvantDroit NOTIFY intensiteAvantDroitChanged)
    // Q_PROPERTY(double intensiteAvantGauche READ intensiteAvantGauche NOTIFY intensiteAvantGaucheChanged)
    // Q_PROPERTY(double intensiteArriereDroit READ intensiteArriereDroit NOTIFY intensiteArriereDroitChanged)
    // Q_PROPERTY(double intensiteArriereGauche READ intensiteArriereGauche NOTIFY intensiteArriereGaucheChanged)
    // Q_PROPERTY(double intensiteCoteDroit READ intensiteCoteDroit NOTIFY intensiteCoteDroitChanged)
    // Q_PROPERTY(double intensiteCoteGauche READ intensiteCoteGauche NOTIFY intensitecoteGaucheChanged)


public:
    explicit UltrasonSensor(QObject *parent = nullptr);

    double avantDroit() const;
    void setAvantDroit(double distance);

    double avantGauche() const;
    void setAvantGauche(double distance);

    double arriereDroit() const;
    void setArriereDroit(double distance);

    double arriereGauche() const;
    void setArriereGauche(double distance);

    double coteDroit() const;
    void setCoteDroit(double distance);

    double coteGauche() const;
    void setCoteGauche(double distance);

    // QColor couleurAvantDroit() const;
    // QColor couleurAvantGauche() const;
    // QColor couleurArriereDroit() const;
    // QColor couleurArriereGauche() const;
    // QColor couleurCoteDroit() const;
    // QColor couleurCoteGauche() const;


    // double intensiteAvantDroit() const;
    // double intensiteAvantGauche() const;
    // double intensiteArriereDroit() const;
    // double intensiteArriereGauche() const;
    // double intensiteCoteDroit() const;
    // double intensiteCoteGauche() const;

signals:
    void avantDroitChanged();
    void avantGaucheChanged();
    void arriereDroitChanged();
    void arriereGaucheChanged();
    void coteDroitChanged();
    void coteGaucheChanged();
    // void couleurAvantDroitChanged();
    // void couleurAvantGaucheChanged();
    // void couleurArriereDroitChanged();
    // void couleurArriereGaucheChanged();
    // void couleurCoteDroitChanged();
    // void couleurCoteGaucheChanged();
    // void intensiteAvantDroitChanged();
    // void intensiteAvantGaucheChanged();
    // void intensiteArriereDroitChanged();
    // void intensiteArriereGaucheChanged();
    // void intensiteCoteDroitChanged();
    // void intensiteCoteGaucheChanged();

private slots :
    void readSerialData();

private:
    double m_avantDroit;
    double m_avantGauche;
    double m_arriereDroit;
    double m_arriereGauche;
    double m_coteDroit;
    double m_coteGauche;
    // QColor m_couleurAvantDroit;
    // QColor m_couleurAvantGauche;
    // QColor m_couleurArriereDroit;
    // QColor m_couleurArriereGauche;
    // QColor m_couleurCoteDroit;
    // QColor m_couleurCoteGauche;

    // double m_intensiteAvantDroit;
    // double m_intensiteAvantGauche;
    // double m_intensiteArriereDroit;
    // double m_intensiteArriereGauche;
    // double m_intensiteCoteGauche;
    // double m_intensiteCoteDroit;

    //void updateCouleurEtIntensite();

    QSerialPort *m_serialPort;
};

#endif // ULTRASONSENSOR_H
