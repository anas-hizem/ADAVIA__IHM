# ROS 2 Humble et Qt 5 Quick

Ce document décrit les étapes nécessaires pour créer un projet intégrant ROS 2 Humble et Qt 5 Quick, ainsi que les instructions pour exécuter ce projet.

## Table des Matières

1. [Introduction](#introduction)
2. [Prérequis](#prérequis)
3. [Création du Projet ROS 2](#création-du-projet-ros-2)
4. [Création du Projet Qt 5 Quick](#création-du-projet-qt-5-quick)
5. [Intégration de ROS 2 avec Qt](#intégration-de-ros-2-avec-qt)
6. [Exécution du Projet](#exécution-du-projet)
7. [Conclusion](#conclusion)

## Introduction

Ce guide vous permettra de créer et d'exécuter un projet combinant ROS 2 Humble avec une interface utilisateur développée en Qt 5 Quick. Vous apprendrez à configurer un environnement de développement, à créer les projets nécessaires, et à intégrer les deux technologies.

## Prérequis

- Ubuntu 22.04 (ou une version compatible)
- ROS 2 Humble installé
- Qt 5 (incluant Qt Quick) installé
- CMake et autres outils de construction (e.g., `build-essential`)

## Création du Projet ROS 2

1. **Configurer l'environnement :**
    ```bash
    source /opt/ros/humble/setup.bash
    ```

2. **Créer un espace de travail ROS 2 :**
    ```bash
    mkdir -p ~/ros2_ws/src
    cd ~/ros2_ws
    ```

3. **Créer un paquet ROS 2 :**
    ```bash
    ros2 pkg create --build-type ament_cmake my_ros2_package
    ```

4. **Modifier le fichier `CMakeLists.txt` et `package.xml` pour ajouter les dépendances nécessaires :**

    - **`CMakeLists.txt` :**
      ```cmake
      find_package(rclcpp REQUIRED)
      find_package(std_msgs REQUIRED)

      add_executable(my_node src/my_node.cpp)
      ament_target_dependencies(my_node rclcpp std_msgs)
      install(TARGETS my_node
        DESTINATION lib/${PROJECT_NAME})
      ```

    - **`package.xml` :**
      ```xml
      <buildtool_depend>ament_cmake</buildtool_depend>
      <depend>rclcpp</depend>
      <depend>std_msgs</depend>
      ```

5. **Construire le paquet :**
    ```bash
    cd ~/ros2_ws
    colcon build
    source install/setup.bash
    ```

    Exemple de structure de répertoire :
    ```css
    ros2_ws/
    ├── src/
    │   └── my_ros2_package/
    │       ├── CMakeLists.txt
    │       ├── package.xml
    │       └── src/
    │           └── my_node.cpp
    └── install/
    ```

## Création du Projet Qt 5 Quick

1. **Créer un nouveau projet Qt Quick :**
    ```bash
    mkdir -p ~/qt_projects/my_qt_project
    cd ~/qt_projects/my_qt_project
    ```

2. **Initialiser le projet avec Qt Creator ou manuellement en utilisant `qmake` ou `cmake` :**
    - Avec Qt Creator : Ouvrez Qt Creator, créez un nouveau projet Qt Quick, et suivez les instructions pour configurer le projet.
    - Avec `cmake` :
      ```bash
      cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
      ```

3. **Ajouter des fichiers QML pour votre interface utilisateur.**

    Exemple de structure de répertoire :
    ```css
    my_qt_project/
    ├── CMakeLists.txt
    ├── Header Files
    ├── Source Files  
    │   └── main.cpp
    ├── qml.qrc
    └── qml/
        ├── assets/
        └── main.qml
    ```

## Intégration de ROS 2 avec Qt

1. **Installer les dépendances ROS 2 pour Qt :**

    Installez le paquet `ros-<distro>-rclcpp` si ce n'est pas déjà fait. Vous pouvez également utiliser le paquet `ros-<distro>-rclcpp-extensions` pour des fonctionnalités supplémentaires.

2. **Configurer le projet Qt pour utiliser ROS 2 :**

    - **Ajouter les chemins de ROS 2 à votre projet Qt :**
      Ajoutez les chemins d'inclusion et de bibliothèque de ROS 2 dans votre `CMakeLists.txt` de Qt :
      ```cmake
      include_directories(/opt/ros/humble/include)
      link_directories(/opt/ros/humble/lib)
      ```

    - **Utiliser les messages ROS 2 dans votre code Qt :**
      Incluez les en-têtes ROS 2 dans votre fichier `main.cpp` ou autres fichiers source :
      ```cpp
      #include "rclcpp/rclcpp.hpp"
      #include "std_msgs/msg/string.hpp"
      ```

    - **Créer une interface Qt pour interagir avec les nodes ROS 2 :**
      Créez une classe Qt qui se connecte à un node ROS 2 et publie/abonne à des topics :
      ```cpp
      class MyRos2Node : public QObject {
          Q_OBJECT
      public:
          MyRos2Node() {
              rclcpp::init(argc, argv);
              node_ = std::make_shared<rclcpp::Node>("qt_node");
              publisher_ = node_->create_publisher<std_msgs::msg::String>("topic_name", 10);
          }
          void publishMessage(const std::string &msg) {
              auto message = std_msgs::msg::String();
              message.data = msg;
              publisher_->publish(message);
          }
      private:
          std::shared_ptr<rclcpp::Node> node_;
          rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
      };
      ```

## Exécution du Projet

1. **Lancer le node ROS 2 :**
    ```bash
    source ~/ros2_ws/install/setup.bash
    ros2 run my_ros2_package my_node
    ```

2. **Lancer l'application Qt :**
    ```bash
    cd ~/qt_projects/my_qt_project
    mkdir build
    cd build
    cmake ..
    make
    ./my_qt_project
    ```

    Assurez-vous que votre application Qt est configurée pour interagir avec le node ROS 2, en utilisant les fonctions que vous avez implémentées dans l'étape précédente.

## Conclusion

Ce guide a couvert les étapes nécessaires pour créer un projet ROS 2 Humble et Qt 5 Quick, intégrer les deux technologies, et exécuter le projet. Vous pouvez maintenant utiliser ces connaissances pour développer des applications complexes combinant ROS 2 et Qt.

Pour toute question ou problème supplémentaire, consultez la documentation officielle de ROS 2 et Qt, ainsi que les forums de support pour des solutions spécifiques.

