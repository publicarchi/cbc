# Pseudo-code Script dépôt Nakala

__ Nota Bene __

Environnement de test: 

- ici tout est dans apitest.nakala.fr
- authentification test clé API: -H  "X-API-KEY: 01234567-89ab-cdef-0123-456789abcdef"
- Quand tout fonctionne, changer le API key et passer sur api.nakala.fr

--> Il me semble plus logique de créer une collection vide au début, et d'ajouter les données(registres) au fur et à mesure



__ SCRIPT __

<!-- définition de la clé d'API-->

var apikey = "01234567-89ab-cdef-0123-456789abcdef" <!-- celle ci est la version test-->

<!--créer la collection X-->

​	<!-- définir les métadonnées-->

​	var metadatas = []

​	pour chaque métadonnée meta

​		var meta.value ="Valeur de la metadonnée"

​		var meta.lang="fr"

​		var meta.typeUri= "http://www.w3.org/2001/XMLSchema#string"

​		var meta.propertyUri = "http://nakala.fr/terms#title" <!--pour title-->

​		metadatas.push(meta)

​	var status ="public" <!-- pas besoin d'en faire une variable si tout ce qu'on met en ligne est public.. -->

​	var datas = [] 

​	var rights = [] <!-- partage de droits possible ici-->

```json
curl -X POST "https://apitest.nakala.fr/collections" -H  "accept: application/json" -H  "X-API-KEY: {apikey}" -H  "Content-Type: application/json" -d "{  \"status\": \"public\",  \"metas\": {metadatas},  \"datas\": [],  \"rights\": []}"


return collection
{
  "code": 201,
  "message": "Collection created",
  "payload": {
    "id": "10.34847/nkl.f4ec5ip9"
  }
}
```

var collectionId = collection.payload.id





<!-- chargement des images-->

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

​		<!-- quand on a chargé toutes les images d'un registre, récupérer leur emplacement temporaire-->

​		var images = curl -X GET "https://apitest.nakala.fr/datas/uploads" -H  "accept: application/json" -H  "X-API-KEY: {apikey}"	

​	<!-- imagesRegistre est un array composé d'objets avec deux propriétés: name et sha1-->

var listeImages = []

for image in images

​	listeImages.push({

​		"sha1" = image.sha1

​		"description" = image.name <!-- partant du principe que le nom est significatif-->

​	<!-- possibilité d'ajouter un embargo, ne me semble pas nécessaire-->

​	})	

var status = "published" <!-- sinon: pending-->

var metas = []

pour chaque métadonnée meta <!--minimum ==> titre, type, auteur, date, licence. cf Doc-->

​		var meta.value ="Valeur de la metadonnée"

​		var meta.lang="fr"

​		var meta.typeUri= "http://www.w3.org/2001/XMLSchema#string"

​		var meta.propertyUri = "http://nakala.fr/terms#title" <!--pour title-->

​		metadatas.push(meta)

var files = listeImages

var collectionsIds = collectionId

var rights = [] <!-- partage de droits possible ici-->

}





problème avec le json??? --> invalid json message received

```json
curl -X POST "https://apitest.nakala.fr/datas" -H  "accept: application/json" -H  "X-API-KEY: 01234567-89ab-cdef-0123-456789abcdef" -H  "Content-Type: application/json" -d "{  \"status\": \"published\",  \"metas\": [{\"value\": \"Donnee test - title\",\"lang\": \"fr\",\"typeUri\": \"http://www.w3.org/2001/XMLSchema#string\",\"propertyUri\":\"value\": \"Donnee test - auteur\",\"lang\": \"fr\",\"typeUri\": http://www.w3.org/2001/XMLSchema#string\",\"propertyUri\": \"http://nakala.fr/terms#type\"},{\"value\": \"Donnee test - auteur\",\"lang\": \"fr\",\"typeUri\": \"http://www.w3.org/2001/XMLSchema#string\",\"propertyUri\": \"http://nakala.fr/terms#creator\"},{\"value\": \"Donnee test - date\",\"lang\": \"fr\",\"typeUri\": \"http://www.w3.org/2001/XMLSchema#string\",\"propertyUri\": \"http://nakala.fr/terms#created\"},{\"value\": \"Donnee test - licence\",\"lang\": \"fr\",\"typeUri\": \"http://www.w3.org/2001/XMLSchema#string\",\"propertyUri\": \"http://nakala.fr/terms#licence\"}],  \"files\": [{\"description\": \"spa_ga_ll_87_f_11_CECRoral.csv\",\"sha1\": \"b0769f7a1f14f6b3939de44912c51a71faaf140e\"},{\"description\": \"spa_ga_ll_87_f_11_conv.cha\",\"sha1\": \"1db0df523a7a9a470718e8b1e25265d366a19cc7\"},{\"description\": \"FRAN_0011_16722_L.jpg\",\"sha1\": \"a4a85e4e543be21e9bed98f50e1360ef7cf6b6d1\"},{\"description\": \"fre_ma_ba_59_f_20_write.txt\",\"sha1\": \"7c14346da1d211e7286595e8e714d738df65c87b\"},],  \"rights\": []}"

```



curl -X POST "https://apitest.nakala.fr/collections" -H  "accept: application/json" -H  "X-API-KEY: {apikey}" -H  "Content-Type: application/json" -d "{  \"status\": \"public\",  \"metas\": {metadatas},  \"datas\": [],  \"rights\": []}"



test

``` json
{
  "status": "published",
  "metas": [
    {
      "value": "Donnee test - title",
      "lang": null,
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#title"
    },
    {
      "value": "http://purl.org/coar/resource_type/c_c513",
      "lang": null,
      "typeUri": "http://www.w3.org/2001/XMLSchema#anyURI",
      "propertyUri": "http://nakala.fr/terms#type"
    },
    {
      "value": null,
      "lang": null,
      "typeUri": null,
      "propertyUri": "http://nakala.fr/terms#creator"
    },
    {
      "value": "2021",
      "lang": null,
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#created"
    },
    {
      "value": "CC0-1.0",
      "lang": null,
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#license"
    }
  ],
  "files": [
    {
        "sha1": "1ca2f03a4bffbeab502954ee8635491ba8270db1",
        "description": "Cat-and-computer.jpg"
    }
  ],
  "collectionsIds": [
    "10.34847/nkl.f4ec5ip9"
  ],
  "rights": []
}


```

