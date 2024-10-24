# Philosophie de Dolibarr

La philosophie de Dolibarr repose sur l’idée d’offrir un progiciel de gestion intégré (PGI ou ERP) modulable, simple à installer, à configurer et à utiliser. Il vise principalement les PME, les freelances et les associations qui recherchent une solution complète mais flexible pour gérer leurs processus métier (clients, commandes, stocks, facturation, etc.).

## 1. Modularité

Dolibarr est extrêmement modulaire. Au lieu d’imposer une solution rigide, il permet d'activer ou désactiver des modules en fonction des besoins spécifiques de chaque entreprise. Par exemple :

- **CRM** : Gestion des clients et prospects.
- **Facturation** : Gestion des devis, factures et paiements.
- **Stock** : Gestion des produits et du stock.
- **Comptabilité** : Gestion des écritures comptables.
- **Projets** : Suivi de projets, tâches et plannings.

Chaque module peut être activé via l'interface, et il n’est pas nécessaire d’utiliser tous les modules. Cela permet aux utilisateurs de ne déployer que ce dont ils ont besoin, réduisant la complexité et augmentant la personnalisation.

## 2. Structure orientée vers les PME

Dolibarr a été conçu pour les petites et moyennes entreprises avec des ressources IT limitées. Cela signifie que :

- L'interface est pensée pour être intuitive et facile à utiliser, même pour les utilisateurs non techniques.
- Les fonctionnalités sont centrées sur les besoins essentiels de gestion : gestion des contacts, des ventes, des achats, de la facturation, et de la logistique.

Cela se traduit aussi par des options de configuration relativement simples, avec des assistants qui guident l’utilisateur à travers les étapes critiques comme la connexion à la base de données ou l’importation de données.

## 3. Autonomie et Contrôle des données

Dolibarr met l'accent sur le contrôle total des données. C’est l'une des raisons pour lesquelles de nombreuses entreprises le choisissent, surtout dans des secteurs sensibles où la confidentialité et la sécurité des données sont primordiales. Vous pouvez choisir d'héberger Dolibarr en interne et de gérer votre propre base de données, ce qui donne une maîtrise complète sur les données de l'entreprise.

Contrairement aux solutions externalisées ou basées sur le cloud, Dolibarr donne la possibilité de :

- Sauvegarder et restaurer les données facilement.
- Contrôler l'accès et la sécurité de l'installation.
- Effectuer des mises à jour sans dépendre d’un prestataire externe.

## 4. Interconnexion et Extensibilité

Dolibarr peut interagir avec d'autres systèmes via des API ou des extensions. Cela permet de l'intégrer dans des environnements IT plus complexes ou de l’adapter aux besoins particuliers d’une entreprise.

En termes d'importation/exportation de données :

- Dolibarr propose des outils d'import/export natifs pour les fichiers CSV, facilitant la transition depuis d'autres systèmes ou l’ajout de nouveaux jeux de données.
- Les modules d'importation permettent une automatisation partielle, mais il est aussi possible d’intervenir directement sur la base de données pour des besoins plus avancés.

## 5. Personnalisation via la configuration et les scripts

Bien que Dolibarr soit prêt à l’emploi dès son installation, il est également très personnalisable :

- Les utilisateurs peuvent ajuster les permissions, les rôles, et les groupes pour répondre aux besoins de leur organisation.
- Les rapports et les vues peuvent être personnalisés selon les préférences des utilisateurs.
- Dolibarr permet aussi la création de scripts personnalisés pour automatiser certaines tâches, telles que l'import de données ou la génération de rapports récurrents.

## 6. Phases critiques lors de l'installation

L’installation de Dolibarr peut être divisée en deux grandes phases :

- **Installation technique** : Il s'agit de la mise en place de l'application et de la base de données. Cette étape implique la configuration du serveur, la connexion au SGBD, et la vérification que les modules nécessaires sont actifs.
- **Configuration métier** : Après l’installation technique, il faut configurer Dolibarr pour l'adapter à l'organisation (comptes utilisateurs, rôles, activation des modules spécifiques, etc.).

L'installation manuelle vous permet d'acquérir une compréhension de l'outil et des options disponibles. C'est crucial avant de passer à une automatisation complète, car cette étape manuelle vous permet de :

- Comprendre les étapes critiques et les dépendances entre modules.
- Identifier les configurations par défaut que vous souhaiterez modifier dans le cadre de votre propre script d'automatisation.

## En résumé

La philosophie de Dolibarr repose sur :

- Modularité et simplicité d'usage.
- Autonomie totale de l’entreprise sur ses données.
- Personnalisation et extensibilité via des modules et des scripts.
- Approche progressive : une installation manuelle initiale permet de découvrir les différentes fonctionnalités avant de se lancer dans une automatisation complète.
