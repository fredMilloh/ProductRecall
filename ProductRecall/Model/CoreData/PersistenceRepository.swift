//
//  PersistenceRepository.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import CoreData

class PersistenceRepository: ObservableObject  {
    
    static let shared = PersistenceRepository()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "RecallSelected")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(record: Record, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        let recallSelected = RecallSelected(context: context)
        recallSelected.id = record.id
        recallSelected.timestamp = record.timestamp
        recallSelected.cardRef = record.cardRef
        recallSelected.legalCharacter = record.legalCharacter
        recallSelected.category = record.category
        recallSelected.subCategory = record.subCategory
        recallSelected.brandName = record.brandName
        recallSelected.modelName = record.modelName
        recallSelected.productId = record.productId
        recallSelected.packaging = record.packaging
        recallSelected.marketingDates = record.marketingDates
        recallSelected.storageTemperature = record.storageTemperature
        recallSelected.healthMark = record.healthMark
        recallSelected.infos = record.infos
        recallSelected.saleGeoArea = record.saleGeoArea
        recallSelected.distributor = record.distributor
        recallSelected.reasonRecall = record.reasonRecall
        recallSelected.risksIncurred = record.risksIncurred
        recallSelected.healthRecommendations = record.healthRecommendations
        recallSelected.additionalRiskDescription = record.additionalRiskDescription
        recallSelected.actionsToTake = record.actionsToTake
        recallSelected.contactNumber = record.contactNumber
        recallSelected.compensationTerms = record.compensationTerms
        recallSelected.endDateRecall = record.endDateRecall
        recallSelected.otherInfos = record.otherInfos
        recallSelected.imagesLink = record.imagesLink
        recallSelected.productsLink = record.productsLink
        recallSelected.flyerLink = record.flyerLink
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(cardRef: String, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        let request: NSFetchRequest<RecallSelected> = RecallSelected.fetchRequest()
        request.predicate = NSPredicate(format: "cardRef == %@", "\(cardRef)")
        do {
            let arrayResponse = try context.fetch(request)
            for item in arrayResponse {
                context.delete(item)
            }
            try context.save()
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    func isSelected(cardRef: String) -> Bool {
        let context = container.viewContext
        let request: NSFetchRequest<RecallSelected> = RecallSelected.fetchRequest()
        request.predicate = NSPredicate(format: "cardRef == %@", "\(cardRef)")
        do {
            let arrayResponse = try context.fetch(request)
            for _ in arrayResponse {
                return true
            }
        } catch {
            return false
        }
        return false
    }
}

//extension PersistenceRepository {
//
//    func convertIntoRecord(selected: RecordSelected) -> RecallViewModel? {
//        guard let id = selected.id,
//              let timestamp = selected.timestamp,
//              let cardRef = selected.cardRef,
//              let legalCharacter = selected.legalCharacter,
//              let category = selected.category,
//              let subCategory = selected.subCategory,
//              let brandName = selected.brandName,
//              let modelName = selected.modelName,
//              let productId = selected.productId,
//              let packaging = selected.packaging,
//              let marketingDates = selected.marketingDates,
//              let storageTemperature = selected.storageTemperature,
//              let healthMark = selected.healthMark,
//              let infos = selected.infos,
//              let saleGeoArea = selected.saleGeoArea,
//              let distributor = selected.distributor,
//              let reasonRecall = selected.reasonRecall,
//              let risksIncurred = selected.risksIncurred,
//              let healthRecommendations = selected.healthRecommendations,
//              let additionalRiskDescription = selected.additionalRiskDescription,
//              let actionsToTake = selected.actionsToTake,
//              let contactNumber = selected.contactNumber,
//              let compensationTerms = selected.compensationTerms,
//              let endDateRecall = selected.endDateRecall,
//              let otherInfos = selected.otherInfos,
//              let imagesLink = selected.imagesLink,
//              let productsLink = selected.productsLink,
//              let flyerLink = selected.flyerLink,
//              let dateRef = selected.dateRef
//        else { return nil }
//
//        return RecallViewModel(recall: Record(
//            count: 0,
//            id: id,
//            timestamp: timestamp,
//            cardRef: cardRef,
//            legalCharacter: legalCharacter,
//            category: category,
//            subCategory: subCategory,
//            brandName: brandName,
//            modelName: modelName,
//            productId: productId,
//            packaging: packaging,
//            marketingDates: marketingDates,
//            storageTemperature: storageTemperature,
//            healthMark: healthMark,
//            infos: infos,
//            saleGeoArea: saleGeoArea,
//            distributor: distributor,
//            reasonRecall: reasonRecall,
//            risksIncurred: risksIncurred,
//            healthRecommendations: healthRecommendations,
//            additionalRiskDescription: additionalRiskDescription,
//            actionsToTake: actionsToTake,
//            contactNumber: contactNumber,
//            compensationTerms: compensationTerms,
//            endDateRecall: endDateRecall,
//            otherInfos: otherInfos,
//            imagesLink: imagesLink,
//            productsLink: productsLink,
//            flyerLink: flyerLink,
//            dateRef: dateRef
//        ))
//    }
//}
