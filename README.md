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

```
PROJET_JEMS/
│
├── mapr_cluster/
│   └── ansible/
│       ├── setup_mapr/
│       │   ├── defaults/
│       │   ├── files/
│       │   ├── handlers/
│       │   ├── meta/
│       │   ├── tasks/
│       │   │   ├── add_license.yml
│       │   │   ├── check_configuration.yml
│       │   │   ├── create_user_group.yml
│       │   │   ├── ...
│       │   └── vars/
│       ├── ansible.cfg
│       ├── inventory.ini
├       ├── start_all.yml        
│       └── README.md
│
├── vagrant/
│   ├── Vagrantfile
│   ├── setup_ansible_user.sh
│   └── ...
│
├── volume_mirroring/
│   ├── generate_bank_data_mapr.sh
│   ├── volume_mirroring.yml
│
└── README.md
```


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
```
## Installation et Configuration

1. **Cloner le Répertoire du Projet**
   ```bash
   git clone https://github.com/Djilllali/mapr_cluster.git
   cd mapr_cluster
   ```

2. **Configurer les Machines Virtuelles avec Vagrant**
Le fichier Vagrantfile configure plusieurs machines virtuelles pour le cluster. Pour démarrer les VMs :
    ```bash 
    cd vagrant 
    vagrant up
    ```
3. **Configurer l'Utilisateur Ansible sur chaque VM**
Après le démarrage des VMs, exécutez le script de configuration des utilisateurs Ansible pour assurer que la connexion SSH sans mot de passe est activée :

    ```bash
    ./setup_ansible_user.sh
    ```
## Exécution du Mirroring
# Le mirroring des volumes est un processus automatisé géré par Ansible et peut être déclenché par les étapes suivantes :

1. **Rendre exécutable le script de génération de données bancaires**

# Ce script crée des fichiers de transactions bancaires à stocker dans le volume A du cluster.

    ```bash
    cd volume_mirroring
    sudo chmod +x generate_bank_data_mapr.sh
    ```
2. **Exécuter le Playbook Ansible pour le Mirroring**

# Utilisez le playbook volume_mirroring.yml pour configurer et exécuter le mirroring entre les volumes A et A' :

    ```bash
    ansible-playbook -i ../ansible/inventory.ini volume_mirroring.yml
    ```

3. **Vérification des Données Répliquées**

# Pour vérifier que les données ont bien été répliquées dans le volume miroir A', utilisez la commande suivante sur le cluster :

    ```bash
    hadoop fs -ls /A_prime/bank_data
    ```
## Fichiers Importants
- **generate_bank_data_mapr.sh** : Ce script génère des données de test pour simuler des transactions bancaires et les stocker dans le volume A.
- **volume_mirroring.yml** : Le playbook Ansible qui configure le mirroring entre les volumes A et A_prime.
- **Vagrantfile ** : Fichier qui configure les machines virtuelles pour le cluster.
- **setup_ansible_user.sh** : Script pour configurer les utilisateurs Ansible sur les machines virtuelles.

### Contributeurs
- [@Djillali ZEROUKHI](https://github.com/Djilllali/): Administrateur Hadoop et Développeur principal du projet.



