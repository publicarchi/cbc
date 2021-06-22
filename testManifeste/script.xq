declare namespace cbc = "namespace";
let $apiKey := "01234567-89ab-cdef-0123-456789abcdef"
let $url := "https://apitest.nakala.fr/datas"
let $collectionId := "10.34847/nkl.f4ec5ip9"
let $fileId := "1ca2f03a4bffbeab502954ee8635491ba8270db1"
let $jsonObject := map{
  "status": "published",
  "metas": [
    map{
      "value": "Donnee test - title",
      "lang": "fr",
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#title"
    },
    map{
      "value": "Donnee test - auteur",
      "lang": "fr",
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#type"
    },
    map{
      "value": "Donnee test - auteur",
      "lang": "fr",
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#creator"
    },
    map{
      "value": "Donnee test - date",
      "lang": "fr",
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#created"
    },
    map{
      "value": "Donnee test - licence",
      "lang": "fr",
      "typeUri": "http://www.w3.org/2001/XMLSchema#string",
      "propertyUri": "http://nakala.fr/terms#licence"
    }
  ],
  "files": [
    map{
        "sha1": "1ca2f03a4bffbeab502954ee8635491ba8270db1",
        "description": "Cat-and-computer.jpg"
    }
  ],
  "collectionsIds": [
    "10.34847/nkl.f4ec5ip9"
  ],
  "rights": []
}


return
http:send-request(
  <http:request method='post' username='admin' password='admin'>
    <http:header name='X-API-KEY' value='{$apiKey}'/>
    <http:header name='Accept' value='application/json'/>
    <http:header name='Content-Type' value='application/json'/>
  </http:request>,
  $url,
  serialize($jsonObject, map{"method" : "json"})

)


