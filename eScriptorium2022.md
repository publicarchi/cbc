https://mensuel.framapad.org/p/htr-9twe?lang=fr

franck.calard@umontreal.ca

daniel.richer.1@umontreal.ca

roch.delannay@umontreal.ca

giulia.ferretti@umontreal.ca

J'ai déjà un compte : mathilde.verstraete@umontreal.ca

\## Répartition de la correction de la segmentation!

https://escriptorium.inria.fr/document/1666/images/

  \- Franck: 225-230 (done) 

  \- Daniel: 231-235 (done)

  \- Talitha: 220-224 (done)

  \- Alix: 236-240 (done) (done)

  \- Emmanuel: 241-245 (done)

  \- Daniel: 246-250 (done)

  

Pages conclues: 220-227 ; 236-242

Le lien pour les transcriptions

https://github.com/publicarchi/cbc/blob/master/pvF21-2534.xml

\## Questions

\### est-ce qu'on transcrit les majuscules ?

3 cas de figures : 

\- majuscules abusives

- \- effets de plumes

- \- usage désuet

\- majuscules manquantes

- \- lié à la ponctuation (mais qui n'est pas toujours là)  

Si l'intention du scripteur est une majuscule (etc Avis) - alors on met une majuscule.

S'il y a une majuscule, on met une majuscule, s'il y a une minuscule on met un minuscule, même en milieu de phrase.

  

\### est-ce qu'on peut entraîner un modèle qui crée des zones pour chaque paragraphes ? 

bof

\### peut-on segmenter les séances

-> types les lignes début et fin de paragraphe (c'est plus facile à gérer et à entraîner)

\### est-ce qu'on transcrit les signatures ?

Typer comme signature. (ex: CustomLine#signature (voir ce que propose SegmOnto)

Possible d’entraîner un lot de pages avec signatures.

\### comment on gère les abréviations ?

on écrit ce qui est écrit

\### comment on gère les mots non clairs ?

XXXX pour chaque mot non lu. Ce qui permet de les extraire.

Alternative ne rien mettre == laisser toute la ligne vide ! (mais attention ça peut être frustrant).

Comment faire pour ne pas apprendre à la machine à lire n’importe quoi ?

\### comment on gère les mots barrés/raturés ?

mettre ~~~ ?

\### comment on gère les diacritiques ?

\- On rétablit les accents quand ils ont été omis, comme on les écrirait aujourd'hui.

\### comment on gère la ponctuation ?

S'il y a un point, on met un point

S'il y a une virgule, on met une virgule, même en fin de phrase. 

\---

\- pour les données d'entraînement, on transcrit ce qu'on voit. Il n’y a pas de contexte dans Kraken et pas de traitement linguistique.

\- se mettre d’accord sur ce que l’on considère être une majuscule.

\- possible utiliser un signe comme pierre d’attente pour un  post-traitement (si pas de pb). Avec le clavier virtuel aurait pu  composer un caractère pas présent par ailleurs.

Transcription littérale des mots tels qu’ils sont inscrits. Mettre la accents car  plus simple lorsque transcrit à la main. D’autant que les accents  peuvent parfois ne pas avoir été intégré dans les zones. Pour la  consistance, rétablir les accents.

Considérer la consistance du scripteur.

Pour les abréviation, résoudre les abréviations ne permet pas de déterminer  les cas ambigus. Rester sur ce qui est formel plutôt que. 

Utiliser ^pour les exposants.

Ne pas lui donner à lire des lettres qui n’existent pas quand il y a des lettres (exemple).

\### comment on gère les caractères spéciaux ? 

On les note avec le clavier virtuel au besoin

\### que fait-on des tirets ?

Écrire ce que l’on lit.

Tenir aussi compte de la simplicité des règles de transcription. Mettre la  poncturation à laquelle s’attend de même que l’accentuation.

\## Divers

Il n’y a pas de word spotting dans Kraken (query-by-example) -> dans eScriptorium c'est (fuzzy)  "query-by-string" avec ElasticSearch (encore en pré-prod mais très  bientôt en prod)

Attention, il n’est pas vraiment possible de réentraîner les lignes. Si refait les lignes, on perd les informations. Si change la segmentation des lignes  on doit réintégrer les données textuelles à la main.

Question comment fonctionne si segmente ailleurs, pour voir si Kraken modifie les ids.

Voir si peut créer un XML compatible avec eScriptorium après. Il existe un schéma d’eScriptorium.

On peut utiliser le clavier virtuel pour créer des raccourcis de saisie (édité à partir d'un JSON).

Lien vers le schéma ALTO utilisé par eScriptorium :

  \- https://www.loc.gov/standards/alto/v4/alto-4-0.xsd

Documentation du module de l'import :

  \- https://gitlab.com/scripta/escriptorium/-/blob/develop/app/apps/imports/README.md

  

Travail en cours dans eScriptorium pour réintégrer des transcriptions.

Dans le volet annotation, il est possible de réintégrer toutes les lignes

\## Guide de transcription

\## Segmentation

Pour la segmentation des paragraphes, typer les premières lignes et les dernières lignes des §

La solution permettrait de régler également la question des fins de page.

Annoter également les dates de séances, etc.

\### Typologie pour les segments et les zones

Propositions pour le niveau de la line :

  \- **CustomLine#signature**

  \- **CustomLine#start_paragraph**

  \- **CustomLine#end_paragraph**

Generic LECTAUREP 26