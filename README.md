# Installation de ROS 2 Humble

Ce guide décrit les étapes pour installer ROS 2 Humble sur Ubuntu 22.04.

## Prérequis

Assurez-vous d'avoir un système Ubuntu 22.04 à jour :

```sh
sudo apt update
sudo apt upgrade
```

## Étape 1 : Configuration des dépôts
### Ajouter le dépôt ROS 2 GPG

```sh
sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
```

### Ajouter les dépôts ROS 2
```sh
echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```

## Étape 2 : Installation de ROS 2 Humble
### Mettre à jour l'index des paquets
```sh
sudo apt update
```

### Installer ROS 2 Humble

```sh
sudo apt install ros-humble-desktop
```

## Étape 3 : Configurer l'environnement
### Ajouter ROS 2 au script de démarrage

Ajoutez la ligne suivante à votre fichier ~/.bashrc :

```sh
source /opt/ros/humble/setup.bash

```
Rechargez le fichier ~/.bashrc pour appliquer les changements :

```sh
source ~/.bashrc

```

## Étape 4 : Tester l'installation
### Créer et initialiser un espace de travail

```sh
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
colcon build

```
### Sourcing de l'espace de travail
Ajoutez la ligne suivante à votre fichier ~/.bashrc :

```sh
source ~/ros2_ws/install/setup.bash
```

Rechargez le fichier ~/.bashrc :

```sh
source ~/.bashrc
```

## Lancer un exemple de nœud

```sh
ros2 run demo_nodes_cpp talker
```


```sh
ros2 run demo_nodes_cpp listener
```
