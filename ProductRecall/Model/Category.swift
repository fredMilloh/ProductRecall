//
//  Category.swift
//  ProductRecall
//
//  Created by fred on 24/03/2022.
//

import Foundation

struct Category: Identifiable {
    var id = UUID().uuidString
    let name: String
    let description: String
    let icon: String
}

extension Category {
    /// allows a search by category
    static var categories = [
        Category(name: "Toutes", description: "All", icon: "all"),
        Category(name: "Alimentation", description: "Alimentation", icon: "supply"),
        Category(name: "Déplacement", description: "Automobiles et moyens de déplacement", icon: "vehicle"),
        Category(name: "Enfants", description: "Bébés-Enfants (hors alimentaire)", icon: "baby"),
        Category(name: "Hygiène", description: "Hygiène-Beauté", icon: "hygiene"),
        Category(name: "Vêtements", description: "Vêtements, Mode, EPI", icon: "clothing"),
        Category(name: "Sports", description: "Sports-loisirs", icon: "sport"),
        Category(name: "Maison", description: "Maison-Habitat", icon: "home"),
        Category(name: "Outils", description: "Appareils électriques, Outils", icon: "electrical"),
        Category(name: "Communication", description: "Equipements de communication", icon: "communication"),
        Category(name: "Autres", description: "Autres", icon: "other")
    ]
}
