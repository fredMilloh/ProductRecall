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
    
    func getSelected(completion: ([RecordSelected]) -> Void) {
        let context = container.viewContext
        let request: NSFetchRequest<RecordSelected> = RecordSelected.fetchRequest()
        do {
            let recordsSelected = try context.fetch(request)
            completion(recordsSelected)
        } catch {
            completion([])
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

