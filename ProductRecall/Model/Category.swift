//
//  Category.swift
//  ProductRecall
//
//  Created by fred on 24/03/2022.
//

import Foundation

struct Category: Identifiable {
    
    var id: Int
    let name: String
    let description: String
    let icon: String
}

var categories = [
    Category(id: 1, name: "Toutes", description: "Toutes catégories", icon: "all"),
    Category(id: 2, name: "Alimentation", description: "Alimentation", icon: "supply"),
    Category(id: 3, name: "Déplacement", description: "Automobiles et moyens de déplacement", icon: "vehicle"),
    Category(id: 4, name: "Enfants", description: "Bébés-Enfants (hors alimentaire)", icon: "baby"),
    Category(id: 5, name: "Hygiène", description: "Hygiène-Beauté", icon: "hygiene"),
    Category(id: 6, name: "Vêtements", description: "Vêtements, Mode, EPI", icon: "clothing"),
    Category(id: 7, name: "Sports", description: "Sports-loisirs", icon: "sport"),
    Category(id: 8, name: "Maison", description: "Maison-Habitat", icon: "home"),
    Category(id: 9, name: "Outils", description: "Appareils électriques, Outils", icon: "electrical"),
    Category(id: 10, name: "Communication", description: "Equipements de communication", icon: "communication"),
    Category(id: 11, name: "Autres", description: "Autres", icon: "other")
]
