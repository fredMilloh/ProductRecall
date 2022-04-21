//
//  RecallViewModel.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

class RecallViewModel: ObservableObject, Identifiable {
    
    @Published var isPersistent = false
    
    let recall: Record
    
    init(recall: Record) {
        self.recall = recall
        isSelected()
    }
    
// MARK: - Description properties
    
    var category: String {
        recall.category.orEmpty
    }
    
    var subCategory: String {
        recall.subCategory.orEmpty
    }
 
    var brandName: String {
        recall.brandName.orEmpty
    }
    
    var modelName: String {
        recall.modelName.orEmpty
    }
 
    var productId: String {
        recall.productId.orEmpty
    }
    
    var packaging: String {
        recall.packaging.orEmpty
    }
    
    var infos: String {
        recall.infos.orEmpty
    }
    
    var marketingDates: String {
        recall.marketingDates.orEmpty
    }
    
    var storageTemperature: String {
        recall.storageTemperature.orEmpty
    }
    
    var healthMark: String {
        recall.healthMark.orEmpty
    }
    
    var cardRef: String {
        recall.cardRef.orEmpty
    }
    
    var id: String {
        recall.id.orEmpty
    }
    
    var timestamp: String {
        recall.timestamp.orEmpty
    }
    
// MARK: - Distribution properties
    
    var distributor: String {
        recall.distributor.orEmpty
    }
    
    var saleGeoArea: String {
        recall.saleGeoArea.orEmpty
    }
    
    var contactNumber: String {
        recall.contactNumber.orEmpty
    }
    
// MARK: - Images properties
    
    var imagesLink: String {
        guard let links = recall.imagesLink else { return "" }
        let arrayOfLink = links.split(separator: " ").map {
            "\($0.trimmingCharacters(in: .whitespaces))"
        }
        let firstLink = arrayOfLink.first
        return firstLink.orEmpty
    }
    
    var imageUrl: URL? {
        return URL(string: imagesLink)
    }
    
    var productsLink: String {
        recall.productsLink.orEmpty
    }
    
    var productImageUrl: URL? {
        let link = productsLink
        return URL(string: link)
    }
    
    var flyerLink: String {
        recall.flyerLink.orEmpty
    }
    
    var flyerImageLink: URL? {
        URL(string: flyerLink)
    }
    
// MARK: - Recall informations properties
    
    var reasonRecall: String {
        recall.reasonRecall.orEmpty
    }
    
    var risksIncurred: String {
        recall.risksIncurred.orEmpty
    }
    
    var healthRecommendations: String {
        recall.healthRecommendations.orEmpty
    }
    
    var additionalRiskDescription: String {
        recall.additionalRiskDescription.orEmpty
    }
   
// MARK: - Conditions properties
    
    var actionsToTake: String {
        recall.actionsToTake.orEmpty
    }
    
    var compensationTerms: String {
        recall.compensationTerms.orEmpty
    }
    
    var endDateRecall: String {
        recall.endDateRecall.orEmpty
    }
    
    var otherInfos: String {
        recall.otherInfos.orEmpty
    }
    
    var legalCharacter: String {
        recall.legalCharacter.orEmpty
    }
    
    var totalCount: Int? {
        recall.count
    }
    
// MARK: - Persistence methods
    
    func isSelected() {
        isPersistent = PersistenceManager.shared.getIsSelected(from: cardRef)
    }

    func togglePersistence() {
        PersistenceManager.shared.togglePersistence(from: cardRef, recall: self)
    }
    
}
// MARK: - Example

extension RecallViewModel {
#if DEBUG
static let example = RecallViewModel(recall: Record(
    count: 100,
    id: "",
    isPersistent: false,
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
))
#endif
}
 
// MARK: - Conform to Equatable

extension RecallViewModel: Equatable {
    static func == (lhs: RecallViewModel, rhs: RecallViewModel) -> Bool {
        return lhs.id == rhs.id
        && lhs.isPersistent == rhs.isPersistent
        && lhs.timestamp == rhs.timestamp
        && lhs.cardRef == rhs.cardRef
        && lhs.legalCharacter == rhs.legalCharacter
        && lhs.category == rhs.category
        && lhs.subCategory == rhs.subCategory
        && lhs.brandName == rhs.brandName
        && lhs.modelName == rhs.modelName
        && lhs.productId == rhs.productId
        && lhs.packaging == rhs.packaging
        && lhs.marketingDates == rhs.marketingDates
        && lhs.storageTemperature == rhs.storageTemperature
        && lhs.healthMark == rhs.healthMark
        && lhs.infos == rhs.infos
        && lhs.saleGeoArea == rhs.saleGeoArea
        && lhs.distributor == rhs.distributor
        && lhs.reasonRecall == rhs.reasonRecall
        && lhs.risksIncurred == rhs.risksIncurred
        && lhs.healthRecommendations == rhs.healthRecommendations
        && lhs.additionalRiskDescription == rhs.additionalRiskDescription
        && lhs.actionsToTake == rhs.actionsToTake
        && lhs.contactNumber == rhs.contactNumber
        && lhs.compensationTerms == rhs.compensationTerms
        && lhs.endDateRecall == rhs.endDateRecall
        && lhs.otherInfos == rhs.otherInfos
        && lhs.imagesLink == rhs.imagesLink
        && lhs.productsLink == rhs.productsLink
        && lhs.flyerLink == rhs.flyerLink
    }
}
