//
//  PersistenceRepository.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//
import SwiftUI
import CoreData

class PersistenceManager: ObservableObject {

    static let shared = PersistenceManager(coreDataStack: CoreDataStack())

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }

    /// Fetched recall array
    @Published var recallSelected: [RecallViewModel] = []

// MARK: - Fetch data

    func fetchSelected() {
        recallSelected.removeAll()
        let request = NSFetchRequest<RecallSelected>(entityName: "RecallSelected")
        do {
            let fetched = try coreDataStack.viewContext.fetch(request)
            recallSelected = fetched.map({ convertIntoRecall(selected: $0)})
        } catch {
            recallSelected = []
        }
    }

	// MARK: - Save data

    func save(recall: RecallViewModel, completion: @escaping (Error?) -> Void) {
        let context = coreDataStack.viewContext
        let recallSelected = RecallSelected(context: context)
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

    func delete(cardRef: String, completion: @escaping (Error?) -> Void) {
        let context = coreDataStack.viewContext
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
        let context = coreDataStack.viewContext
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
            delete(cardRef: cardRef) { _ in}
        } else {
            recall.isPersistent.toggle()
            save(recall: recall) { _ in}
        }
    }
}

	// MARK: - Extension

extension PersistenceManager {

    func convertIntoRecall(selected: RecallSelected) -> RecallViewModel {
        let record = Record(
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
            endDateRecall: selected.endDateRecall,
            otherInfos: selected.otherInfos,
            imagesLink: selected.imagesLink,
            flyerLink: selected.flyerLink
        )
        return RecallViewModel(recall: record)
    }
}
