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

    /// Retrieves the first link in the list
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
    static let record = Record(
        cardRef: "2022-03-0002",
        legalCharacter: "Volontaire (sans arrêté préfectoral)",
        category: "Bébés-Enfants (hors alimentaire)",
        subCategory: "Articles pour enfants et puériculture",
        brandName: "BIBS",
        modelName: "BIBS BabyGlassBottle 225ml Ivoire",
        productId: "5713795220915 Tous les lots  5713795220922",
        packaging: "Biberon 110 ml ou 225 ml dans leur emballage individuel",
        marketingDates: "Du 20/01/2022 au 28/02/2022",
        storageTemperature: "null",
        healthMark: "",
        infos: "Biberons complet en verre, comprenant 1 capuchon, 1 tétine, 1 anneau de vissage et 1 support  BUMPER",
        saleGeoArea: "France entière",
        distributor: "Voir la liste des points de vente en France Métropolitaine.",
        reasonRecall: "Le BUMPER se déforme lorsqu'il est en contact avec une chaleur très élevée.",
        risksIncurred: "Blessures externes",
        healthRecommendations: "",
        additionalRiskDescription: "L'eau chaude du Biberon peut se renverser au moment du remplissage.",
        actionsToTake: "Contacter le point de vente Contacter le service consommateur",
        contactNumber: "0134285708",
        compensationTerms: "Autre (voir informations complémentaires)",
        endDateRecall: "jeudi 31 mars 2022",
        otherInfos: "Si vous souhaitez garder les produits : Jetez simplement le pare-chocs.",
        imagesLink: "http://rappel.conso.gouv.fr/image/998281b2-5ede-450b-b3a4-666c9903db63.jpg",
        flyerLink: "http://rappel.conso.gouv.fr/affichettePDF/6347/Interne"
    )
    static let example = RecallViewModel(recall: RecallViewModel.record)
#endif
}
