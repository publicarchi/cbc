const fs = require('fs') 
const https = require('https')

//définitions 
//API Nakala
const apiUrl = 'https://apitest.nakala.fr/'
// clé d'api pour authentification avec Nakala
const apiKey = '01234567-89ab-cdef-0123-456789abcdef'



// Étape de création d'une collection Nakala
// todo




//Étape d'importation des images

const dir = '../../TestNakala/' //dossier à parcourir

var uploadUrl = apiUrl.concat('datas/uploads')

fs.readdir(dir, (err, files) => {
    if (err) {
        throw err;
    }

    // pour chaque fichier dans le dossier
    // envoyer une requête POST/datas/uploads à Nakala
    files.forEach(file => {
        

        
        //fichier à charger
        var formData = JSON.stringify({
            file: fs.createReadStream(`${dir}${file}`), 
            type: 'image/jpeg' //à mettre en variable pour importer différents types de fichiers
        })
        
        var uploadOptions = {
            hostname: uploadUrl,
            port: 443,
            path: '/todos', //what is this for? 
            method: 'POST',
            headers: {
                'Content-Type': 'multipart/form-data',
                'accept': 'application/json',
                'X-API-KEY': apiKey
            }
        }

        //requête
        const req = https.request(uploadOptions, res => {
            console.log(`statusCode: ${res.statusCode}`)

            res.on('formData', d => {
                process.stdout.write(d)
            })
        })

        req.on('error', error => {
            console.error(error)
          })
          
        req.write(formData)
        req.end()

    });
})