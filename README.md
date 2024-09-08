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

PROJET_JEMS/ │ ├── mapr_cluster/ │ └── ansible/ │ ├── setup_mapr/ │ │ ├── defaults/ │ │ ├── files/ │ │ ├── handlers/ │ │ ├── meta/ │ │ ├── tasks/ │ │ │ ├── add_license.yml │ │ │ ├── check_configuration.yml │ │ │ ├── create_user_group.yml │ │ │ ├── ... │ │ └── vars/ │ ├── ansible.cfg │ ├── inventory.ini │ └── README.md │ ├── vagrant/ │ ├── Vagrantfile │ ├── setup_ansible_user.sh │ └── ... │ ├── volume_mirroring/ │ ├── generate_bank_data_mapr.sh │ ├── volume_mirroring.yml │ └── README.md



## Prérequis

Avant de commencer, assurez-vous que votre environnement dispose des éléments suivants :
- **VirtualBox** : pour la gestion des machines virtuelles.
- **Vagrant** : pour automatiser le déploiement des VMs.
- **Ansible** : pour l'orchestration et la configuration automatique du cluster.
- **MapR** : pour la gestion des volumes et le mirroring.

### Commandes d'installation sur Ubuntu

```bash
# Installation de Vagrant
sudo apt-get install vagrant

# Installation d'Ansible
sudo apt-get install ansible

# Installation de VirtualBox
sudo apt-get install virtualbox
