//
//  RecordViewModel.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation

struct RecordViewModel {
    
    let record: Record
 
// MARK: - Description
    
    var category: String {
        record.category ?? ""
    }
    
    var subCategory: String {
        record.subCategory ?? ""
    }
 
    var brandName: String {
        record.brandName ?? ""
    }
    
    var modelName: String {
        record.modelName ?? ""
    }
 
    var productID: String {
        record.productId ?? ""
    }
    
    var packaging: String {
        record.packaging ?? ""
    }
    
    var infos: String {
        record.infos ?? ""
    }
    
    var marketingDates: String {
        record.marketingDates ?? ""
    }
    
    var storageTemperature: String {
        record.storageTemperature ?? ""
    }
    
    var healthMark: String {
        record.healthMark ?? ""
    }
    
// MARK: - Distribution
    
    var distributor: String {
        record.distributor ?? ""
    }
    
    var saleGeoArea: String {
        record.saleGeoArea ?? ""
    }
    
    var contactNumber: String {
        record.contactNumber ?? ""
    }
    
// MARK: - Images
    
    var imageUrl: URL? {
        let links = record.imagesLink?.split(separator: " ").map {
            "\($0.trimmingCharacters(in: .whitespaces))"
        }
        return URL(string: links?[0] ?? "")
    }
    
    var productImageUrl: URL? {
        guard let link = record.productsLink else { return imageUrl }
        return URL(string: link)
    }
    
    var flyerImageLink: URL? {
        URL(string: record.flyerLink ?? "")
    }
    
// MARK: - Recall informations
    
    var reasonRecall: String {
        record.reasonRecall ?? ""
    }
    
    var risksIncurred: String {
        record.risksIncurred ?? ""
    }
    
    var healthRecommendations: String {
        record.healthRecommendations ?? ""
    }
    
    var additionalRiskDescription: String {
        record.additionalRiskDescription ?? ""
    }
   
// MARK: - Conditions
    
    var actionToTake: String {
        record.actionsToTake ?? ""
    }
    
    var compensationTerms: String {
        record.compensationTerms ?? ""
    }
    
    var endDateRecall: String {
        record.endDateRecall ?? ""
    }
    
    var otherInfos: String {
        record.otherInfos ?? ""
    }
    
    var legalCharacter: String {
        record.legalCharacter ?? ""
    }
    
// MARK: - Example
    #if DEBUG
    static let example = Record(
        id: "",
        timestamp: "",
        cardRef: "2022-03-0002",
        legalCharacter: "Volontaire (sans arrêté préfectoral)",
        category: "Bébés-Enfants (hors alimentaire)",
        subCategory: "Articles pour enfants et puériculture",
        brandName: "BIBS",
        modelName: "BIBS BabyGlassBottle 225ml Ivoire\r\nBIBS BabyGlassBottle 225ml Blush\r\nBIBS BabyGlassBottle 225ml Sauge\r\nBIBS BabyGlassBottle  110ml Ivoire\r\nBIBS BabyGlassBottle  110ml Blush\r\nBIBS BabyGlassBottle 110ml Sauge",
        productId: "5713795220915 Tous les lots  5713795220922 Tous les lots  5713795220939 Tous les lots  5713795220885 Tous les lots  5713795220892 Tous les lots",
        packaging: "Biberon 110 ml ou 225 ml dans leur emballage individuel",
        marketingDates: "Du 20/01/2022 au 28/02/2022",
        storageTemperature: "null",
        healthMark: "",
        infos: "Biberons complet en verre, comprenant 1 capuchon, 1 tétine, 1 anneau de vissage et 1 support  BUMPER",
        saleGeoArea: "France entière",
        distributor: "Voir la liste des points de vente en France Métropolitaine.",
        reasonRecall: "Le BUMPER accessoire, non indispensable au biberon, se déforme lorsqu'il est en contact avec une chaleur très élevée. En se déformant,  il rend la bouteille instable au moment du remplissage.",
        risksIncurred: "Blessures externes",
        healthRecommendations: "",
        additionalRiskDescription: "L'eau chaude du Biberon peut se renverser au moment du remplissage. L'eau trop chaude peut provoquer des brulures. Nous rappelons qu'il faut vérifier la température des aliments avant de nourrir bébé.",
        actionsToTake: "Contacter le point de vente Contacter le service consommateur",
        contactNumber: "0134285708",
        compensationTerms: "Autre (voir informations complémentaires)",
        endDateRecall: "jeudi 31 mars 2022",
        otherInfos: "Si vous souhaitez garder les produits : \r\nJetez simplement le pare-chocs et utilisez le produit comme d'habitude sans la partie inférieure appelée  BUMPER . Le biberon et ses autres caractéristiques sont parfaitement sûrs sans cet élément.",
        imagesLink: "http://rappel.conso.gouv.fr/image/998281b2-5ede-450b-b3a4-666c9903db63.jpg http://rappel.conso.gouv.fr/image/d5d9105b-961a-4159-bf21-35c08045f69d.jpg http://rappel.conso.gouv.fr/image/390c421b-9aac-4d12-b242-4206d9c69261.jpg",
        productsLink: "http://rappel.conso.gouv.fr/document/2f1b8d02-db59-4d04-ae0d-96c6c2f5476f/Interne/ListeDesProduits",
        flyerLink: "http://rappel.conso.gouv.fr/affichettePDF/6347/Interne",
        dateRef: "2022-03"
    )
    #endif
}
