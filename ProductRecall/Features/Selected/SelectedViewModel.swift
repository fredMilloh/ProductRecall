//
//  SelectedViewModel.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

class SelectedViewModel: ObservableObject {
    
    @ObservedObject var persistenceRepository = PersistenceRepository.shared
    
    @Published var selectedList: [Record] = [] {
        didSet { emptyArray = selectedList.isEmpty }
    }
    @Published var emptyArray = false
    
    func getSelected() {
        selectedList = [Record]()
        persistenceRepository.getSelected { selected in
            for item in selected {
                guard let selectedRecord = convertIntoRecord(selected: item) else { return }
                selectedList.append(selectedRecord)
            }
        }
    }
}
extension SelectedViewModel {
    
    func convertIntoRecord(selected: RecordSelected) -> Record? {
        guard let id = selected.id,
              let timestamp = selected.timestamp,
              let cardRef = selected.cardRef,
              let legalCharacter = selected.legalCharacter,
              let category = selected.category,
              let subCategory = selected.subCategory,
              let brandName = selected.brandName,
              let modelName = selected.modelName,
              let productId = selected.productId,
              let packaging = selected.packaging,
              let marketingDates = selected.marketingDates,
              let storageTemperature = selected.storageTemperature,
              let healthMark = selected.healthMark,
              let infos = selected.infos,
              let saleGeoArea = selected.saleGeoArea,
              let distributor = selected.distributor,
              let reasonRecall = selected.reasonRecall,
              let risksIncurred = selected.risksIncurred,
              let healthRecommendations = selected.healthRecommendations,
              let additionalRiskDescription = selected.additionalRiskDescription,
              let actionsToTake = selected.actionsToTake,
              let contactNumber = selected.contactNumber,
              let compensationTerms = selected.compensationTerms,
              let endDateRecall = selected.endDateRecall,
              let otherInfos = selected.otherInfos,
              let imagesLink = selected.imagesLink,
              let productsLink = selected.productsLink,
              let flyerLink = selected.flyerLink,
              let dateRef = selected.dateRef
        else { return nil }
        
        return Record(
            id: id,
            timestamp: timestamp,
            cardRef: cardRef,
            legalCharacter: legalCharacter,
            category: category,
            subCategory: subCategory,
            brandName: brandName,
            modelName: modelName,
            productId: productId,
            packaging: packaging,
            marketingDates: marketingDates,
            storageTemperature: storageTemperature,
            healthMark: healthMark,
            infos: infos,
            saleGeoArea: saleGeoArea,
            distributor: distributor,
            reasonRecall: reasonRecall,
            risksIncurred: risksIncurred,
            healthRecommendations: healthRecommendations,
            additionalRiskDescription: additionalRiskDescription,
            actionsToTake: actionsToTake,
            contactNumber: contactNumber,
            compensationTerms: compensationTerms,
            endDateRecall: endDateRecall,
            otherInfos: otherInfos,
            imagesLink: imagesLink,
            productsLink: productsLink,
            flyerLink: flyerLink,
            dateRef: dateRef
        )
    }
}

