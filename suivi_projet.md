# Suivi de progrès

## Semaine 42

| Date       | Objectifs accomplis                                            | Difficultés rencontrées                                     |
|------------|----------------------------------------------------------------|-------------------------------------------------------------|
| 2024-10-16 | - Recerches sur Dolibarr et les ERP-CRM<br>- Identification des objectifs principaux<br>- Création des données à utiliser dans la base de données   | - Pas de difficultés notoires car pas d'objectifs techniques |
| 2024-10-17 | - Création du dépôt et ajout des contributeurs<br>- Exploration de Dolibarr<br>- Mise en place d'un premier docker-compose avec Dolibarr et MariaDB       | - Le docker compose contient les deux composantes nécessaires mais celles-ci ne sont pas encore reliées   |


---

## Notes générales

- **Réflexion hebdomadaire** : 
  - On a réussi à s'organiser et à se mettre en route relativement vite 
  - Il aurait fallu faire un peu plus de choses le 16.
- **Objectifs pour la semaine prochaine** : Réussir à relier la base de données et Dolibarr, pour que celui-ci puisses lire les données importées.

---

## Semaine 43

| Date       | Objectifs accomplis                                            | Difficultés rencontrées                                     |
|------------|----------------------------------------------------------------|-------------------------------------------------------------|
| 2024-10-24 | - Dolibarr et MariaDB liés avec succès<br>- Création d'un script d'installation<br>- Tentative de mise en place d'import automatique des données dans MariaDB     | - Importer les données en utlisant un script SQL de lancement ne fonctionne pas car les tables créées sont ensuite écrasées par Dolibarr |
| 2024-10-25 | - Ajout d'un script qui force MariaDB à attendre la création des tables par Dolibarr avant d'importer       | - Le script crée une boucle infinie (MariaDB et Dolibarr s'attendent mutuellement)   |


---

## Notes générales

- **Réflexion hebdomadaire** : 
  - On a été plutôt efficaces, on est désormais environ à mi-chemin
- **Objectifs pour la semaine prochaine** : 
  - Finaliser l'import automatique 
  - Mettre en place l'activation des modules
  - Démarrer la documentation

---

## Semaine 45

| Date       | Objectifs accomplis                                            | Difficultés rencontrées                                     |
|------------|----------------------------------------------------------------|-------------------------------------------------------------|
| 2024-11-04 | - Modification du script d'installation pour qu'il importe les données après le lancement des deux conteneurs<br>- Création du sommaire de la documentation    | - Un erreur dans la syntaxe de docker exec empêchait le bon fonctionnement de l'import |
| 2024-11-05 | - Recherches activation automatique des modules<br>- Début script de back-up       | - Fonctions plus avancées de Dolibarr qui requièrent des recherches supplémentaires   |
| 2024-11-06 | - Tentative acitvation automatique des modules<br>- Clarification objectifs       | - L'activation des modules en mettant à jour la table SQL manuellement est trop compliqué.
