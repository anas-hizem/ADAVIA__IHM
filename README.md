# Détection de Personnes et Interface Graphique avec PyQt5

## Description
Ce projet est une partie du système ADAVIA IHM pour un bus autonome. Il se concentre sur la détection des personnes dans une vidéo et l'affichage des statistiques associées via une interface graphique PyQt5. Le système utilise un modèle de détection d'objets basé sur YOLO (You Only Look Once) pour identifier les personnes dans un flux vidéo. Les résultats sont ensuite affichés dans une application PyQt5 en temps réel, montrant le nombre de personnes entrant, sortant, et présentes à tout moment.

## Contexte
Dans le cadre du projet ADAVIA IHM, il est crucial de suivre le nombre de passagers à bord du bus autonome pour assurer la sécurité et la gestion efficace des ressources. Ce module de détection de personnes permet de surveiller les entrées et les sorties des passagers en temps réel, fournissant des informations essentielles pour la gestion de l'occupation du véhicule.

## Prérequis
- **Python 3.x** : Assurez-vous d'avoir Python installé sur votre système.
- **PyQt5** : Pour l'interface graphique.
- **OpenCV** : Pour le traitement d'images.
- **YOLO** : Pour la détection d'objets.
- **NumPy** : Pour les opérations sur les tableaux.
- **SORT (Simple Online and Realtime Tracking)** : Pour le suivi des objets.
