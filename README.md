# ProductRecall


## Table of Contents

-   [Introduction](https://github.com/fredMilloh/ProductRecall#introduction)
-   [Features](https://github.com/fredMilloh/ProductRecall#features)
-   [Screenshots](https://github.com/fredMilloh/ProductRecall#screenshots)
-   [IDE](https://github.com/fredMilloh/ProductRecall#ide)
-   [Skills](https://github.com/fredMilloh/ProductRecall#skills)
-   [How to use](https://github.com/fredMilloh/ProductRecall#how-to-use)
-   [License](https://github.com/fredMilloh/ProductRecall#license)


## Introduction

Application permettant de partager des rappels de produits de consommation non conformes. L'utilisateur peut retenir, dans une liste persitante, les rappels qu'il veut consulter ou partager ultérieurement. 


English version :

Application for sharing reminders of non-compliant consumer products. The user can select, in a persistent list, the reminders he wants to consult or share later.

## Features

Page d'accueil :
 - Propose la liste des derniers rappels dans la catégorie "Alimentation".
 - L'utilisateur peut changer de catégorie, la liste est alors mise à jour.
 - Un bouton en bas de page permet une recherche plus ciblée.
 - Chaque cellule de rappel comprend un bouton de partage, et un autre de sauvegarde.

La recherche :
 - Le bouton recherche ouvre une page en popup.
 - L'utilisateur peut renseigné un produit, une marque, un mot-clé.
 - Puis choisir une catégorie.
 - Quand sa requête est complétée, l'utilisateur appui sur le bouton "recherche" du clavier.
 - La popup disparaît pour permettre l'affichage de la liste des résultats.
 - Le bouton recherche indique le mot-clé de la recherche.
 - Une croix permet de réinitialiser la recherche.
 - La liste affiche alors les derniers rappels dans la catégorie en cours.

La sauvegarde des rappels
 - Chaque cellule de rappel propose un bouton de partage.
 - Quand l'utilisateur appui dessus, une popup d'activité apparaît.
 - Le rappel peut être partagé avec les applications installées sur le smartphone de l'utilisateur.
 - Le rappel est sous forme de fiche au format PDF.
 - Dans la vue détaillée du rappel, un bouton permet de voir cette fiche avant de la partager.


English version :

Home page:
 - Provides a list of the latest reminders in the "Food" category.
 - The user can change the category, the list is then updated.
 - A button at the bottom of the page allows a more targeted search.
 - Each reminder cell includes a share button, and a save button.

The search :
 - The search button opens a popup page.
 - The user can enter a product, a brand, a keyword.
 - Then choose a category.
 - When the query is completed, the user presses the "search" button on the keyboard.
 - The popup disappears and the list of results is displayed.
 - The search button indicates the keyword of the search.
 - A cross allows the search to be reset.
 - The list then displays the latest reminders in the current category.

Saving reminders
 - Each reminder cell has a share button.
 - When the user presses it, an activity popup appears.
 - The reminder can be shared with the applications installed on the user's smartphone.
 - The reminder is in the form of a PDF file.
 - In the detailed view of the reminder, a button allows to see this card before sharing it.


## Screenshots

<img width="200" alt="Capture d’écran 2022-05-14 à 13 15 36" src="https://user-images.githubusercontent.com/47221695/168423474-0e771e94-dd69-43fe-adb9-a4a7c54e7795.png"><img width="200" alt="Capture d’écran 2022-05-14 à 13 16 09" src="https://user-images.githubusercontent.com/47221695/168423477-6ff29b9c-39e1-4934-8ef9-d08ee588f935.png"><img width="200" alt="Capture d’écran 2022-05-14 à 13 16 20" src="https://user-images.githubusercontent.com/47221695/168423479-c96dd39b-114b-43b3-9aa6-4db693ee595d.png"><img width="200" alt="Capture d’écran 2022-05-14 à 13 16 40" src="https://user-images.githubusercontent.com/47221695/168423481-ff5741ad-e122-4b05-a04f-f1bee8871925.png">

## IDE
-   Swift 5.3
-   iOS deployment target 15.4
-   Xcode 13.3.1

## Skills
-   SwiftUI
-   Combine
-   MVVM
-   CoreData
-   UIViewControllerRepresentable
-   UIActivityController
-   Code coverage

## How To Use

Depuis votre terminal : 
 - Forker le projet
 - Créer une branche et travailler dessus
 - Publier la branche sur son fork
 - Créer la pull-request

From your terminal :
 - Fork the project
 - Create a branch and work on it
 - Publish the branch on its fork
 - Create the pull-request

```
$ git clone https://github.com/fredMilloh/ProductRecall
```

**API**

Cette application utilise une API en data open source : 

This application uses an open source data API :

Documentation Rappel Conso : https://api.gouv.fr/documentation/api-rappel-conso


## License

[MIT License](https://github.com/fredMilloh/ProductRecall/blob/master)

----------------------------------------------------------------------------------------

Cette application a été crée par l'étudiant.

application coded from scratch.

