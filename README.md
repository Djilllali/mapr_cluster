# Projet JEMS - Cluster MapR avec Volume Mirroring

Ce projet implémente un cluster Hadoop MapR avec des services critiques tels que le mirroring de volumes. Il permet à une banque d'assurer une haute disponibilité des données et d'optimiser la récupération après sinistre. Le projet est conçu pour être automatisé via **Ansible** et s'exécute dans un environnement **Vagrant** avec des machines virtuelles.

## Table des Matières
1. [Présentation du Projet](#présentation-du-projet)
2. [Structure du Projet](#structure-du-projet)
3. [Prérequis](#prérequis)
4. [Installation et Configuration](#installation-et-configuration)
5. [Exécution du Mirroring](#exécution-du-mirroring)
6. [Fichiers Importants](#fichiers-importants)
7. [Contributeurs](#contributeurs)

## Présentation du Projet

L'objectif principal de ce projet est de mettre en place un cluster MapR capable de répliquer des volumes de données critiques pour une banque à des fins de résilience et de récupération après sinistre. En cas de panne, le volume miroir (A') permet de continuer à accéder aux données sans interruption.

### Fonctionnalités clés :
- **Mirroring de Volume** : Réplication des données d'un volume A vers un volume A' en utilisant MapR.
- **Automatisation Ansible** : Provisionnement, configuration et gestion du cluster via des playbooks Ansible.
- **Génération de Données Bancaires** : Script Bash pour simuler des transactions bancaires et les stocker dans les volumes.

## Structure du Projet

L'arborescence du projet est la suivante :

