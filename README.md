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

- **Système d'exploitation :** Ubuntu 22.04
- **ROS 2 Humble :** Installé et configuré
- **Qt 5 :** Installé, incluant Qt Quick
- **CMake et outils de construction :** Installés (e.g., `build-essential`)

## Objectif

L'objectif de ce projet est de développer une interface graphique en Qt 5 Quick qui permet de commander le robot `turtlesim` dans ROS 2. L'interface doit :

- Envoyer des commandes de mouvement (avant, arrière, gauche, droite) au robot.
- Ajuster la vitesse du robot à l'aide d'un curseur.

## Structure du Projet

Le projet est composé de deux parties principales :

1. **Code ROS 2 :** Implémenté dans le fichier `my_qt_node.cpp`. Ce code définit un node ROS 2 qui publie des messages de type `geometry_msgs/msg/Twist` sur le topic `turtle1/cmd_vel`.
2. **Interface Qt :** Utilise Qt 5 pour créer une interface graphique avec des boutons pour la direction et un curseur pour la vitesse.

### Structure des Répertoires

```css
my_qt_project/
├── CMakeLists.txt
├── Header Files
├── Source Files  
│   └── main.cpp
└── qml/
    ├── assets/
    └── main.qml
```
## Fonctionnalités
1. **Publisher et Subscriber**:
- Publisher : En ROS 2, un publisher est utilisé pour envoyer des messages sur un topic. Dans ce projet, le publisher envoie des messages de type geometry_msgs/msg/Twist sur le topic turtle1/cmd_vel pour contrôler le robot turtlesim.
- Subscriber : Le code actuel ne contient pas de subscriber, mais il est utilisé pour recevoir des messages depuis un topic. Pour étendre cette fonctionnalité, vous pourriez ajouter un subscriber pour recevoir des informations sur la position du robot ou d'autres données.

2. **Composants de l'Interface**:
- Boutons de Direction : Quatre boutons permettent de commander le robot dans différentes directions (avant, arrière, gauche, droite).
- Curseur de Vitesse : Un curseur ajuste la vitesse du robot. La vitesse est déterminée en fonction de la valeur du curseur, allant de 0 à 100.
## Perspectives
1. **Amélioration de l'Interface** : Ajouter des éléments visuels supplémentaires pour afficher l'état actuel du robot, comme sa position ou sa vitesse.
2. **Gestion des Erreurs** : Ajouter des mécanismes pour gérer les erreurs et les exceptions, comme les commandes invalides ou les problèmes de connexion au robot.
3. **Tests et Validation** : Effectuer des tests approfondis pour s'assurer que l'interface fonctionne correctement avec différentes valeurs de vitesse et de direction.
## Étapes Prochaines
1. **Tester l'Interface** : Lancez turtlesim et l'application Qt pour vérifier que les boutons et le curseur fonctionnent comme prévu.
2. **Évaluer les Performances** : Vérifiez que les commandes sont correctement envoyées et que le robot répond en temps réel.
3. **Ajouter des Fonctionnalités** : Considérez l'ajout de nouvelles fonctionnalités, comme un affichage en temps réel de la position du robot ou des commandes supplémentaires.
