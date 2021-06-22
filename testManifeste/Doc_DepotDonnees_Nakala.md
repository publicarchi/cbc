# Dépôt données dans Nakala

## Documentation de l'API

### 0. POST/collections

Les informations suivantes sont à transmettre 

- Statut de la collection (private ou public) 
- Liste des identifiants des données à ajouter à la collection. Une
   collection publique ne peut contenir que des données publiées. 
- Métadonnées descriptives de la collection :
  - lang : la liste des valeurs acceptées est disponible via GET
     /vocabularies/languages (cf. fichier nakala-languages.json)
  - typeUri : la liste des valeurs acceptées est disponible via GET /vocabularies/metadatatypes (cf. fichier nakala-metadatatypes.json)
  - propertyUri : la liste des valeurs acceptées est disponible via GET /vocabularies/properties (cf. fichier nakala-properties.json)
  - La  métadonnée http://nakala.fr/terms#title est obligatoire. Partage de droits sur cette collection

Forme générale: 

```json
{  
	"status": "public",  
	"metas": [
		{
            "value": "string",
            "lang": "string",
            "typeUri": "string",
            "propertyUri": "string"
            }
        ],
    "datas": [],
    "rights": []
}
```

[documentation sur les droits](https://documentation.huma-num.fr/nakala/#la-creation-dune-collection-la-gestion-des-droits-et-des-groupes). À retenir: 

- Une donnée peut appartenir à plusieurs collections
- Les droits de gestion d’une collection sont indépendants des droits de gestion de données qu’elle contient
- En cas de travail collaboratif: Pour faciliter l’ajout de membres, il est possible de créer des listes d’utilisateurs (appartenant au même projet, par exemple) dans l’onglet **Listes** et d’ajouter ensuite directement cette liste à la collection

Exemple de titre en métadonnée

```json
"value": "Titre de Collection",    
"lang": "fr",    
"typeUri": "http://www.w3.org/2001/XMLSchema#string", 
"propertyUri": "http://nakala.fr/terms#title"
```





### 1. POST / data / uploads

Permet de déposer un fichier dans un espace temporaire de NAKALA pour être ensuite associé à une donnée (requête POST /datas)

- 201: Retourne l'empreinte SHA1 du fichier déposé sur le serveur Example ValueModel

  ```
  {  "name": "string",
  	"sha1": "string" 
  }
  ```

- 401: Clé d'API manquante ou non valide 

- 403: Clé d'API non valide ou utilisateur inconnu 

- 500: Erreur lors de l'enregistrement du fichier

### 2. GET/data/uploads

Récupération de la liste des objets fichiers déposés non encore associés à une donnée

### 3. POST/datas

Dépôt d'une nouvelle donnée

Paramètres: 

- Statut de la donnée (pending ou published) 
- Liste des identifiants des collections où ranger la donnée. Une collection publique ne peut contenir que des données publiées.  NB; Il est possible de créer la collection avant ou après.
- Métadonnées descriptives de la donnée :
  - lang : la liste des valeurs acceptées est disponible via GET /vocabularies/languages
  - typeUri : la liste des valeurs acceptées est disponible via GET /vocabularies/metadatatypes
  - propertyUri : la liste des valeurs acceptées est disponible via GET /vocabularies/properties
  - value : les valeurs de certaines métadonnées sont validées.
    Par exemple http://nakala.fr/terms#license doit valider les codes retournés par GET /vocabularies/licenses et http://nakala.fr/terms#type ceux retournés par GET /vocabularies/datatypes
  - Cinq métadonnées sont obligatoires pour décrire une donnée :
    - **Titre** (nakala:title, multivaluée) 
    - **Type** (nakala:type, unique) http://nakala.fr/terms#type
    - **Auteur** (nakala:creator, multivaluée)  
      - renseignez un auteur sous la forme d'un objet {givenname, surname, orcid}. Indiquez null si l'auteur est anonyme
      - http://nakala.fr/terms#creator
    - **Date** (nakala:created, unique) 
      - renseignez une date sous la forme année, année-mois ou année-mois-jour. Indiquez null si la date de création est inconnue 
      - http://nakala.fr/terms#created
    - **Licence** (nakala:license, unique)http://nakala.fr/terms#license
  - Fichier(s) de la donnée :
    - sha1 : identifiant du fichier déposé via POST /datas/uploads
    - description : (optionnel) description sur le fichier
    - embargoed: (optionnel, format=Y-m-d) 
    - date de fin d'embargo 
  - Partage de droits sur cette donnée  (si un seul compte qui gère ça ne devrait pas être une préoccupation pour le moment)

Exemple: 

```
{
  "status": "published",
  "metas": [
    {
      "value": "string",
      "lang": "string",
      "typeUri": "string",
      "propertyUri": "string"
    }
  ],
  "files": [
    {
      "sha1": "string",
      "description": "string",
      "embargoed": "string"
    }
  ],
  "collectionsIds": [
    "string"
  ],
  "rights": []
}
```

Voir les réponses du serveur: 

- si 201: est-ce qu'on récupère l'identifiant? 

Pour la modification des données: PUT/datas/{identifier}

- NB: L'édition des champs "metas" et "datas" requière le  ROLE_EDITOR et l'édition des champs "status" et "rights" requière le  ROLE_ADMIN. 



