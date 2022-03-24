//
//  Category.swift
//  ProductRecall
//
//  Created by fred on 24/03/2022.
//

import Foundation

struct Category: Identifiable {
    var id = UUID()
    let name: String
}

extension Category {
    /// allows a search by category
    static var categories = [
        Category(name: "Alimentation"),
        Category(name: "Automobiles et moyens de déplacement"),
        Category(name: "Bébés-Enfants (hors alimentaire)"),
        Category(name: "Hygiène-Beauté"),
        Category(name: "Vêtements, Mode, EPI"),
        Category(name: "Sports-loisirs"),
        Category(name: "Maison-Habitat"),
        Category(name: "Appareils électriques, Outils"),
        Category(name: "Equipements de communication"),
        Category(name: "Autres")]
}
