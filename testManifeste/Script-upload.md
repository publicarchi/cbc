# Pseudo-code Script dépôt Nakala

__ Nota Bene __

Environnement de test: 

- ici tout est dans apitest.nakala.fr
- authentification test clé API: -H  "X-API-KEY: 01234567-89ab-cdef-0123-456789abcdef"
- Quand tout fonctionne, changer le API key et passer sur api.nakala.fr



Il me semble plus logique de créer une collection vide au début, et d'ajouter les données(registres) au fur et à mesure

__ SCRIPT __

<!-- définition de la clé d'API-->

var apikey = "01234567-89ab-cdef-0123-456789abcdef"



<!--créer la collection X-->

<!-- définir les métadonnées-->

var metadatas = []

pour chaque métadonnée meta

​	var meta.value ="Valeur de la metadonnée"

​	var meta.lang="fr"

​	var meta.typeUri= "http://www.w3.org/2001/XMLSchema#string"

​	var meta.propertyUri = "http://purl.org/dc/elements/1.1/title" <!--pour title-->

​	metadatas.push(meta)

var status ="public" <!-- pas besoin d'en faire une variable si tout ce qu'on met en ligne est public.. -->

var datas = [] <!-- voir si on peut créer une collection vide dans un premier temps--> 

var rights 

```
curl -X POST "https://apitest.nakala.fr/collections" -H  "accept: application/json" -H  "X-API-KEY: {apikey}" -H  "Content-Type: application/json" -d "{  \"status\": \"public\",  \"metas\": {metadatas},  \"datas\": [],  \"rights\": [    {      \"id\": \"b55e770c-849b-11ea-87ea-0242ac1b0003\",      \"role\": \"ROLE_READER\"    }  ]}"
```



Pour chaque registre r {

​	Pour chaque fichier f dans r{

​		var name = "nom du fichier". Exemple: "Cat-and-computer.jpg"

​		var type = "type du fichier". Exemple: "image/jpeg"

​		<!-- upload du fichier-->

​		<!-- mettre à jour les variables: -F "file={filename};type={filetype}"-->

​		var upload = curl -X POST "https://apitest.nakala.fr/datas/uploads" -H  "accept: application/json" -H  "X-API-KEY: {apikey}" -H  "Content-Type: multipart/form-data" -F "file=@{name};type={type}" 

​		<!-- s'assurer que la requête est bonne avant de continuer-->

​		<!-- 201: retourne une paire avec le nom du fichier et le sha1-->

​		if (!upload.name && upload.sha1){

​			catch error

​		}

​	}

​	<!-- quand on a chargé toutes les images d'un registre, récupérer leur emplacement temporaire-->

​		var images = curl -X GET "https://apitest.nakala.fr/datas/uploads" -H  "accept: application/json" -H  "X-API-KEY: {apikey}"	

​	<!-- images est un array composé d'objets avec deux propriétés: name et sha1-->







}



