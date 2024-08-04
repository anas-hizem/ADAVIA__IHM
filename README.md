# ADAVIA IHM : Intégration de ROS 2 Humble et Qt 5 Quick pour contrôler Turtlesim

Ce document décrit la création d'une interface utilisateur en Qt 5 Quick pour commander un robot `turtlesim` en utilisant ROS 2 Humble. Vous apprendrez à configurer l'environnement, créer les projets nécessaires, et exécuter l'application pour contrôler la direction et la vitesse du robot.

## Table des Matières

1. [Description](#description)
2. [Contexte](#contexte)
3. [Prérequis](#prérequis)
4. [Objectif](#objectif)
5. [Structure du Projet](#structure-du-projet)
6. [Fonctionnalités](#fonctionnalités)
7. [Perspectives](#perspectives)
8. [Étapes Prochaines](#étapes-prochaines)

## Description

Ce projet combine ROS 2 Humble et Qt 5 Quick pour créer une interface graphique permettant de contrôler un robot `turtlesim`. L'interface comprend quatre boutons pour diriger le robot (avant, arrière, gauche, droite) et un curseur pour ajuster la vitesse.

## Contexte

`Turtlesim` est un package de simulation simple dans ROS 2 utilisé pour tester des commandes de mouvement et visualiser les résultats. L'interface utilisateur développée en Qt 5 Quick permet de contrôler ce simulateur de manière intuitive, en envoyant des commandes de direction et de vitesse.

## Prérequis

- **Ubuntu 22.04** (ou une version compatible)
- **ROS 2 Humble** installé
- **Qt 5** (incluant Qt Quick) installé
- **CMake** et autres outils de construction (`build-essential`)
- **Turtlesim** installé via ROS 2

## Objectif

L'objectif principal est de développer une interface graphique en Qt qui permet de :
- Contrôler la direction de `turtlesim` en utilisant quatre boutons (avant, arrière, gauche, droite).
- Ajuster la vitesse de `turtlesim`.

## Structure du Projet

Le projet est composé de deux parties principales :

1. **Code ROS 2 :** Implémenté dans le fichier `my_qt_node.cpp`. Ce code définit un node ROS 2 qui publie des messages de type `geometry_msgs/msg/Twist` sur le topic `turtle1/cmd_vel`.
2. **Interface Qt :** Utilise Qt 5 pour créer une interface graphique avec des boutons pour la direction et un curseur pour la vitesse.
## Structure des Répertoires

### Structure des Répertoires ROS 2

```plaintext
ros2_ws/
├── build
├── install
├── log
└── src
    └── my_qt_package
        ├── build
        ├── include
        ├── src
        │   └── my_node_package.cpp
        ├── CMakeLists.txt
        └── package.xml
```
build/ : Répertoire où les fichiers de construction sont générés.
install/ : Répertoire où les fichiers installés sont placés.
log/ : Répertoire pour les journaux de construction.
src/ : Contient le code source du paquet ROS 2.
src/my_qt_package/ : Nom du paquet ROS 2.
src/my_qt_package/build/ : Répertoire de construction spécifique au paquet.
src/my_qt_package/include/ : Contient les fichiers d'en-tête.
src/my_qt_package/src/ : Contient les fichiers source, y compris my_node_package.cpp.
src/my_qt_package/CMakeLists.txt : Fichier de configuration pour CMake.
src/my_qt_package/package.xml : Décrit le paquet ROS 2.



### Structure des Répertoires Qt Quick

```plaintext

my_qt_project/
├── CMakeLists.txt
├── Header Files
├── Source Files  
│   └── main.cpp
└── qml/
    ├── assets/
    └── main.qml
```
CMakeLists.txt : Fichier de configuration pour CMake.
Header Files/ : Contient les fichiers d'en-tête C++.
Source Files/ : Contient les fichiers source C++.
qml/ : Contient les fichiers QML pour l'interface utilisateur.
assets/ : Contient les ressources telles que les images.
main.qml : Fichier QML principal pour l'interface utilisateur.


## Fonctionnalités
1. **Publisher et Subscriber**:
- Publisher : En ROS 2, un publisher est utilisé pour envoyer des messages sur un topic. Dans ce projet, le publisher envoie des messages de type geometry_msgs/msg/Twist sur le topic turtle1/cmd_vel pour contrôler le robot turtlesim.
- Subscriber : Le code actuel ne contient pas de subscriber, mais il est utilisé pour recevoir des messages depuis un topic. Pour étendre cette fonctionnalité, vous pourriez ajouter un subscriber pour recevoir des informations sur la position du robot ou d'autres données.

# Implémentation
- **ROS 2** : Le code dans my_node_package.cpp crée un node qui publie des messages sur des topics pour contrôler la direction et la vitesse de turtlesim.
- **Qt 5 Quick** : L'interface graphique dans main.qml permet de contrôler turtlesim en utilisant des boutons et un curseur. Le code C++ dans main.cpp établit une connexion entre l'interface utilisateur Qt et le node ROS 2

2. **Composants de l'Interface**:
- Boutons de Direction : Quatre boutons permettent de commander le robot dans différentes directions (avant, arrière, gauche, droite).
- Curseur de Vitesse : Un curseur ajuste la vitesse du robot. La vitesse est déterminée en fonction de la valeur du curseur, allant de 0 à 100.
