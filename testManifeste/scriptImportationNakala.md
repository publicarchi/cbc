# Notes sur le script d'importation 

Pour le moment, traite le contenu d'un dossier:
- pour chaque fichier dans le dossier

Quand ça fonctionne, on pourra créer un boucle pour l'ensemble des dossiers.


### Fonctions


fs.readdir()
- permet de lister les fichiers d'un dossier
- [Node.js method](https://attacomsian.com/blog/nodejs-list-directory-files): works asynchronously to read the contents of the given directory and returns an array of the names of the files in the directory excluding . and ..

fs.readFile('image.jpg, function(){ dostuff })



HTTPS:
- [https requests](https://nodejs.dev/learn/making-http-requests-with-nodejs)
- https://nodejs.org/dist/latest-v14.x/docs/api/https.html#https_https_request_options_callback
- https://nodejs.org/dist/latest-v14.x/docs/api/http.html#http_http_request_options_callback

Comment faire un requête avec un data-form pour envoyer l'image?
equivalent curl:  -F "file=@{name};type={type}" 