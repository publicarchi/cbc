# Script manifeste

## Base 

créer un fichier json, contient un objet qui a les propriétés suivantes: 

```json
{
    "@context": "http://iiif.io/api/presentation/2/context.json",
    "@type": "sc:Manifest",
	"@id": "http://05ea0f53-fc38-4830-a794-b1ae5fe6afff", /*id*/
    "label": "Test manifest CBC", /*label*/
    "description": "This manifest is...", /*description*/
    "attribution": "Images: ... . Manifeste IIIF: ..." /*attribution*/
    "logo": "url.com/img.jpg" /*si souhaité*/
    "license": "https://creativecommons.org/licenses/by/3.0/", /*choix de licences*/
	"viewingDirection": "left-to-right",
  	"viewingHint": "individuals",
    "license": "",
    "thumbnail": {...},
    "metadata": [],
	"related": [],
	"sequences": [],
	"structures"; []
}
    
```

## Thumbnail

Thumbnail du manifeste.

Choisir une image dans le manifeste et ajuster sa taille (150, = largeur 150, hauteur selon ratio).

Exemple: 

``` json
{
    "@id": "https://iiif.irht.cnrs.fr/iiif/Châteauroux/B360446201_MS0005/jp2/B360446201_MS0005_0004/full/150,/0/default.jpg", /*choix image (resized)*/
    "@type": "dctypes:Image",
    "format":"image/jpeg",
    "width": 150, /*ajuster en conséquence*/
    "height": 113, /*ajuster en conséquence*/
    "service": {
      "@context": "http://iiif.io/api/image/2/context.json",
      "profile": "http://iiif.io/api/image/2/level2.json",
      "@id": "https://iiif.irht.cnrs.fr/iiif/Châteauroux/B360446201_MS0005/jp2/B360446201_MS0005_0004"/*semble être le id de l'image sélectionnée*/
    }
```

## Metadata

Array de métadonnées.

Chaque métadonnée est un objet à deux propriétés: *label* et *values*

```json
{
    "label": "Type",
    "value": "Manuscrit reconstitué (reconstitution virtuelle)"
}
```

Autres labels employés:

- "Etablissement de conservation (pages du manuscrit)"
- "Etablissement de conservation (enluminures découpées)"
- "label": "Cotes"
- "label": "Fournisseurs des images numériques"

## Related

Array de liens pertinents. Chaque relation est un objet à deux propriétés: *label* et *@id* 

Exemple: notices.

``` 
    {
      "label": "Notice BnF du recueil factice du Cabinet des Estampes",
      "@id": "http://catalogue.bnf.fr/ark:/12148/cb40341664z"
    },
```



## Sequences

*Sequences* est un array de *sequences*, mais je n'ai pas encore trouvé des exemples qui justifierait l'utilisation de plusieurs séquences. <!-- est-ce que ce serait pertinent pour chaîner les registres? à approfondir-->

Chaque séquence se structure comme suit:

```json
{
      "@id": "https://bvmm.irht.cnrs.fr/iiif/4490/sequence/default", /*id séquence*/
      "@type": "sc:Sequence",
      "label": "Reproduction intégrale", /*label séquence*/
      "canvases": []
}
```

### Canevases

*Canevases* est un array de *canevas*, structuré comme suit: 

``` json
{
    "@id": "https://bvmm.irht.cnrs.fr/iiif/4490/canvas/canvas-981357", /*id canevas*/
    "@type": "sc:Canvas",
    "label": "plat supérieur", /*label canevas*/
    "height": 5412, /*hauteur canevas*/
    "width": 7216, /*largeur canevas*/
    "images": []
}
        
```

#### Images

*Images* est un array *d'images*, structurées comme suit:

``` json
{
    "@type": "oa:Annotation", /*pourquoi annotation? trouver la typologie*/
    "motivation": "sc:painting", /*pourquoi painting? trouver la typologie*/
    "resource": {
        "@id": "https://iiif.irht.cnrs.fr/iiif/Châteauroux/B360446201_MS0005/jp2/B360446201_MS0005_0001/full/full/0/default.jpg", /*iiif image*/
        "@type": "dctypes:Image",
        "format": "image/jpeg", /*format image*/
        "height": 5412, /*hauteur image*/
        "width": 7216, /*largeur image*/
        "service": {
            "@context": "http://iiif.io/api/image/2/context.json",
            "@id": "https://iiif.irht.cnrs.fr/iiif/Châteauroux/B360446201_MS0005/jp2/B360446201_MS0005_0001", /*id iiif image*/
    		"profile": "http://iiif.io/api/image/2/level2.json"
   		}
    },
    "on": "https://bvmm.irht.cnrs.fr/iiif/4490/canvas/canvas-981357" /*situe l'image sur le canevas. URI du canevas*/
}
```



## Structures

Continent des légendes? 



## Terminologie

- label: String, ne semble pas être normalisé
- @id: uri