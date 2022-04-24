//
//  PersistenceRepository.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//
import SwiftUI
import CoreData

class PersistenceManager: ObservableObject {
    
    static let shared = PersistenceManager()
    
    var container: NSPersistentContainer
    
    @Published var recallSelected: [RecallViewModel] = []
    var selectedArray: [RecallSelected] = []
    
    init() {
        container = NSPersistentContainer(name: "RecallSelected")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

// MARK: - Fetch data
    
    func fetchSelected(completion: @escaping ([RecallSelected]) -> () = {_ in}) {
        recallSelected.removeAll()
        let request = NSFetchRequest<RecallSelected>(entityName: "RecallSelected")
        do {
            selectedArray = try container.viewContext.fetch(request)
            completion(selectedArray)
            convertSelectedToRecall()
        } catch {
            completion([])
        }
    }
    
    func convertSelectedToRecall() {
        for select in selectedArray {
            let converted = self.convertIntoRecall(selected: select)
            recallSelected.append(converted)
        }
    }

// MARK: - Save data
    
    func save(recall: RecallViewModel, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        let recallSelected = RecallSelected(context: context)
        recallSelected.id = recall.id
        recallSelected.isSelected = recall.isPersistent
        recallSelected.timestamp = recall.timestamp
        recallSelected.cardRef = recall.cardRef
        recallSelected.legalCharacter = recall.legalCharacter
        recallSelected.category = recall.category
        recallSelected.subCategory = recall.subCategory
        recallSelected.brandName = recall.brandName
        recallSelected.modelName = recall.modelName
        recallSelected.productId = recall.productId
        recallSelected.packaging = recall.packaging
        recallSelected.marketingDates = recall.marketingDates
        recallSelected.storageTemperature = recall.storageTemperature
        recallSelected.healthMark = recall.healthMark
        recallSelected.infos = recall.infos
        recallSelected.saleGeoArea = recall.saleGeoArea
        recallSelected.distributor = recall.distributor
        recallSelected.reasonRecall = recall.reasonRecall
        recallSelected.risksIncurred = recall.risksIncurred
        recallSelected.healthRecommendations = recall.healthRecommendations
        recallSelected.additionalRiskDescription = recall.additionalRiskDescription
        recallSelected.actionsToTake = recall.actionsToTake
        recallSelected.contactNumber = recall.contactNumber
        recallSelected.compensationTerms = recall.compensationTerms
        recallSelected.endDateRecall = recall.endDateRecall
        recallSelected.otherInfos = recall.otherInfos
        recallSelected.imagesLink = recall.imagesLink
        recallSelected.productsLink = recall.productsLink
        recallSelected.flyerLink = recall.flyerLink
        
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
 
// MARK: - Delete data
    
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

// MARK: - Search data
    
    func getIsSelected(from cardRef: String) -> Bool {
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

// MARK: - toggle
    
    func togglePersistence(from cardRef: String, recall: RecallViewModel) {
        if recall.isPersistent {
            recall.isPersistent.toggle()
            delete(cardRef: cardRef)
        } else {
            recall.isPersistent.toggle()
            save(recall: recall)
        }
    }
}

//MARK: - Extension

extension PersistenceManager {

    func convertIntoRecall(selected: RecallSelected) -> RecallViewModel {
        let record = Record(
            count: 0,
            id: selected.id,
            isPersistent: selected.isSelected,
            timestamp: selected.timestamp,
            cardRef: selected.cardRef,
            legalCharacter: selected.legalCharacter,
            category: selected.category,
            subCategory: selected.subCategory,
            brandName: selected.brandName,
            modelName: selected.modelName,
            productId: selected.productId,
            packaging: selected.packaging,
            marketingDates: selected.marketingDates,
            storageTemperature: selected.storageTemperature,
            healthMark: selected.healthMark,
            infos: selected.infos,
            saleGeoArea: selected.saleGeoArea,
            distributor: selected.distributor,
            reasonRecall: selected.reasonRecall,
            risksIncurred: selected.risksIncurred,
            healthRecommendations: selected.healthRecommendations,
            additionalRiskDescription: selected.additionalRiskDescription,
            actionsToTake: selected.actionsToTake,
            contactNumber: selected.contactNumber,
            compensationTerms: selected.compensationTerms,
            endDateRecall:selected.endDateRecall,
            otherInfos: selected.otherInfos,
            imagesLink: selected.imagesLink,
            productsLink: selected.productsLink,
            flyerLink: selected.flyerLink,
            dateRef: ""
        )
        return RecallViewModel(recall: record)
    }
}