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
        container = NSPersistentContainer(name: "RecordSelected")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save(record: Record, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        let recordSelected = RecordSelected(context: context)
        recordSelected.id = record.id
        recordSelected.timestamp = record.timestamp
        recordSelected.cardRef = record.cardRef
        recordSelected.legalCharacter = record.legalCharacter
        recordSelected.category = record.category
        recordSelected.subCategory = record.subCategory
        recordSelected.brandName = record.brandName
        recordSelected.modelName = record.modelName
        recordSelected.productId = record.productId
        recordSelected.packaging = record.packaging
        recordSelected.marketingDates = record.marketingDates
        recordSelected.storageTemperature = record.storageTemperature
        recordSelected.healthMark = record.healthMark
        recordSelected.infos = record.infos
        recordSelected.saleGeoArea = record.saleGeoArea
        recordSelected.distributor = record.distributor
        recordSelected.reasonRecall = record.reasonRecall
        recordSelected.risksIncurred = record.risksIncurred
        recordSelected.healthRecommendations = record.healthRecommendations
        recordSelected.additionalRiskDescription = record.additionalRiskDescription
        recordSelected.actionsToTake = record.actionsToTake
        recordSelected.contactNumber = record.contactNumber
        recordSelected.compensationTerms = record.compensationTerms
        recordSelected.endDateRecall = record.endDateRecall
        recordSelected.otherInfos = record.otherInfos
        recordSelected.imagesLink = record.imagesLink
        recordSelected.productsLink = record.productsLink
        recordSelected.flyerLink = record.flyerLink
        recordSelected.dateRef = record.dateRef
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
        let request: NSFetchRequest<RecordSelected> = RecordSelected.fetchRequest()
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
        let request: NSFetchRequest<RecordSelected> = RecordSelected.fetchRequest()
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

extension PersistenceRepository {
    
    func convertIntoRecord(selected: RecordSelected) -> RecallViewModel? {
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
        
        return RecallViewModel(recall: Record(
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
        ))
    }
}
