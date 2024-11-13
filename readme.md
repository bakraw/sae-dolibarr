# SAE51 - projet 3 : Installation d’un ERP/CRM

## 1 Préparation du projet

### 1-1 Le projet

Pour ce projet, nous sommes les responsables informatique d'une entrepirse XXX. Dans ce sénario, la direction souhaite migrer
d’une solution ERP/CRM externalisée vers une solution d'herbergement en interne, basée sur le progiciel ”Dolibarr”.

La direction à exporter ces données actuel en format CSV. Ce fichier comprend les informations sur les fichiers clients, fournisseurs, factures, commandes et autres information. 
De plus la direction nous confie un cahier des charges.

Ce cahier des charges comrpend l'étude de la mise en place d'un Dolibarr fonctionnel sur un serveur d'édié de l'entrepise. Ce qui nous demandera de gêrer l'installation, 
l'import et la sauvegarde des données en cas d'incident. Ce qui sera donc notre plan de reprise d'activiter. 


### 1-2 Les objectifs 

Pour réaliser la demande de la direction et donc remplir notre cahier des charges.

- Il nous faudra créer un script qui va automatiser l'installation de dolibarr avec les différents outils dont il a besoin et que nous avions besoin pour ce projet 
- Nous devions aussi penser à la sauvegarde des données qui un des aspects spéciaux du projet.
- Afin de pouvoir lançée sans problèmes nos différents script, nous allions dockerisée notre projets. 


### 1-3 Fichier CSV 

Pour ce projet, nous aurion bession d'information qui pourrion simuler les informations tipiques d'une entreprise. Pour sa, nous avions générer des informations par une IA avec des paramêtres divers, comme le nom de la sociéter, leurs type de relation avec notre entreprise, l'adresse, le code postal, la ville, le pays et les coordonnées de l'entrepris. 
Et nous obtenons, le tableaux suivant : 

| Type        | Nom                     | Adresse                  | Code Postal | Ville        | Pays         | Téléphone         | Email                          |
|-------------|-------------------------|--------------------------|-------------|--------------|--------------|-------------------|--------------------------------|
| Client      | Société Alpha            | 12 Rue des Fleurs         | 75000       | Paris        | France       | +33 1 23 45 67 89  | contact@alpha.fr               |
| Client      | Compagnie Beta           | 21 Boulevard des Nations  | 69000       | Lyon         | France       | +33 4 67 89 10 11  | support@beta.com               |
| Client      | InnovTech GmbH           | 15 Hauptstrasse           | 10115       | Berlin       | Allemagne    | +49 30 12345678    | info@innovtech.de              |
| Client      | Green Energy Ltd         | 10 Oxford Street          | W1D 1NN     | Londres      | Royaume-Uni  | +44 20 7946 0958   | sales@greenenergy.co.uk        |
| Client      | Vision Global Corp       | 2401 Broadway             | 10024       | New York     | États-Unis   | 12 125 550 198     | global@visioncorp.us           |
| Fournisseur | FourniturePro            | 45 Rue des Artisans       | 13000       | Marseille    | France       | +33 4 12 34 56 78  | contact@fournipro.fr           |
| Fournisseur | Matériaux Direct         | 78 Avenue des Bâtisseurs  | 34000       | Montpellier  | France       | +33 6 45 78 12 34  | commande@materiauxdirect.fr    |
| Fournisseur | Global Import Srl        | 33 Via Roma               | 20121       | Milan        | Italie       | +39 02 1234567     | import@globalimport.it         |
| Fournisseur | Technosupply Ltd         | 1200 Yonge Street         | M4T 1W1     | Toronto      | Canada       | 14 165 551 234     | order@technosupply.ca          |
| Client      | Créations Lumière SARL   | 8 Rue de la République    | 69007       | Lyon         | France       | +33 9 87 65 43 21  | support@crealumiere.fr         |
| Client      | Entreprise de Construction| 23 Boulevard Pasteur      | 33000       | Bordeaux     | France       | +33 5 56 78 12 34  | info@constructeur.com          |
| Client      | Mercado Solutions S.A.   | Calle Gran Via 56         | 28013       | Madrid       | Espagne      | +34 91 123 4567    | contact@mercadosolutions.es    |



## 2 Découverte des élèments clés 

Dans se projet, nous avions découvert plusieurs notions comme ERP et CRM mais aussi le progiciel dolibarr. 

### 2-1 ERP & CRM

#### ERP (Enterprise Resource Planning)

Un ERP, ou progiciel de gestion intégré en français, est un logiciel destiné à centraliser et gérer tous les processus et informations d’une entreprise dans une seule base de données. Cela permet une gestion unifiée de plusieurs fonctions essentielles, comme :

- Les finances : comptabilité, facturation, suivi des dépenses et revenus.
- La gestion des stocks et de la production : suivi des stocks, planification de la production, gestion des achats et des ventes.
- Les ressources humaines : gestion de la paie, des congés, des absences et des données des employés.
- L'objectif principal d'un ERP est d'améliorer la collaboration et l'efficacité au sein de l'entreprise en éliminant les silos d'informations, en permettant à tous les départements de travailler avec les mêmes données actualisées.

#### CRM (Customer Relationship Management)

Un CRM, ou gestion de la relation client, est un système centré sur la gestion des interactions avec les clients et les prospects. Il aide les entreprises à suivre et à gérer chaque point de contact client, depuis les premiers échanges commerciaux jusqu’au support après-vente. Les principales fonctions d'un CRM incluent :

- La gestion des contacts : centralisation des informations de clients et prospects.
- Le suivi des opportunités commerciales : gestion des devis, des commandes et des potentiels clients.
- L'automatisation du marketing et des ventes : suivi des campagnes marketing et des pipelines de ventes.
- Le CRM vise à améliorer la satisfaction client et à accroître les ventes en assurant une communication personnalisée et un suivi attentif des besoins et des attentes des clients.

### 2-2 Dolibarr 

Dolibarr est un logiciel open-source de gestion d’entreprise, qui combine les fonctionnalités d’un ERP (Enterprise Resource Planning) et d’un CRM (Customer Relationship Management). Conçu principalement pour les petites et moyennes entreprises (PME), il propose une solution intégrée pour gérer différents aspects d’une organisation : clients, fournisseurs, facturation, stocks, et bien plus encore.
Dolibarr présente des avantages importants : 

#### Points forts

- Gratuit et open source : Solution économique et personnalisable.
- Modulaire : Activez seulement les fonctionnalités dont vous avez besoin.
- Facile à utiliser : Interface simple, adaptée aux petites entreprises.
- Installation rapide : Peut être installé en local ou sur serveur, compatible avec plusieurs systèmes.
- Bonne communauté : Aide et documentation disponibles, plus des extensions pour enrichir le logiciel.

#### Points faibles

- Limité pour les grandes entreprises : Pas idéal pour des besoins complexes.
- Performances : Peut ralentir avec beaucoup de données.
- Fonctions de comptabilité et CRM basiques : Nécessite parfois des modules supplémentaires.
- Support payant : Assistance directe limitée si vous n'avez pas d'expert interne.
- Interface simple : Moins moderne que d'autres ERP.

Ce logiciel est excellente pour les petites entreprises avec des besoins de gestion basiques, mais limité pour les grandes entreprises ou des besoins très spécifiques.

## 3 Scripts du projets 
### 3-1 Docker-compose
### 3-2 Install
### 3-3 Import_csv
### 3-4 Backup



## 4 Bilan du projet
### 4-1 Conclusion 
### 4-2 Point fort 
### 4-3 Point faible
### 4-4 Nos avis 
