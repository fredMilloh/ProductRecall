//
//  Product.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation

// MARK: - Product
struct Product: Codable {
   let count: Int?
   let records: [Record]
}

// MARK: - Record
/// Identifiable protocol - makes it possible to use value types that need to have a stable notion of identity
struct Record: Codable, Identifiable {
   /// UUID - A universally unique identifier to identify a particular datafield and types
   var id = UUID().uuidString
   let isPersistent: Bool
   let cardRef: String?
   let legalCharacter: String?
   let category: String?
   let subCategory: String?
   let brandName: String?
   let modelName: String?
   let productId: String?
   let packaging: String?
   let marketingDates: String?
   let storageTemperature: String?
   let healthMark: String?
   let infos: String?
   let saleGeoArea: String?
   let distributor: String?
   let reasonRecall: String?
   let risksIncurred: String?
   let healthRecommendations: String?
   let additionalRiskDescription: String?
   let actionsToTake: String?
   let contactNumber: String?
   let compensationTerms: String?
   let endDateRecall: String?
   let otherInfos: String?
   let imagesLink: String?
   let flyerLink: String?
   let dateRef: String?
}

extension Product {

   enum MainKeys: String, CodingKey {
      case totalCount = "total_count"
      case records = "records"

      enum RecordsKeys: String, CodingKey {
         case record

         enum RecordKeys: String, CodingKey {
            case fields

            enum FieldsKeys: String, CodingKey {
                case cardRef = "reference_fiche"
                case legalCharacter = "nature_juridique_du_rappel"
                case category = "categorie_de_produit"
                case subCategory = "sous_categorie_de_produit"
                case brandName = "nom_de_la_marque_du_produit"
                case modelName = "noms_des_modeles_ou_references"
                case productId = "identification_des_produits"
                case packaging = "conditionnements"
                case marketingDates = "date_debut_fin_de_commercialisation"
                case storageTemperature = "temperature_de_conservation"
                case healthMark = "marque_de_salubrite"
                case infos = "informations_complementaires"
                case saleGeoArea = "zone_geographique_de_vente"
                case distributor = "distributeurs"
                case reasonRecall = "motif_du_rappel"
                case risksIncurred = "risques_encourus_par_le_consommateur"
                case healthRecommendations = "preconisations_sanitaires"
                case additionalRiskDescription = "description_complementaire_du_risque"
                case actionsToTake = "conduites_a_tenir_par_le_consommateur"
                case contactNumber = "numero_de_contact"
                case compensationTerms = "modalites_de_compensation"
                case endDateRecall = "date_de_fin_de_la_procedure_de_rappel"
                case otherInfos = "informations_complementaires_publiques"
                case imagesLink = "liens_vers_les_images"
                case flyerLink = "lien_vers_affichette_pdf"
                case dateRef = "date_ref"
            }
         }
      }
   }

   init(from decoder: Decoder) throws {
      /// main container
      let container = try decoder.container(keyedBy: MainKeys.self)

      /// totalCount
       self.count = try container.decodeIfPresent(Int.self, forKey: .totalCount)

      /// records array
      var recordsArray = try container.nestedUnkeyedContainer(forKey: .records)

      var records = [Record]()

      while !recordsArray.isAtEnd {

         /// container of one element (links + record)
         let elementContainer = try recordsArray.nestedContainer(keyedBy: MainKeys.RecordsKeys.self)
         /// record container
         let recordContainer = try elementContainer.nestedContainer(
            keyedBy: MainKeys.RecordsKeys.RecordKeys.self,
            forKey: .record)

         /// fields container
         let fieldsContainer = try recordContainer.nestedContainer(
            keyedBy: MainKeys.RecordsKeys.RecordKeys.FieldsKeys.self,
            forKey: .fields)

         let cardRef = try fieldsContainer.decodeIfPresent(String.self, forKey: .cardRef)
         let legalCharacter = try fieldsContainer.decodeIfPresent(String.self, forKey: .legalCharacter)
         let category = try fieldsContainer.decodeIfPresent(String.self, forKey: .category)
         let subCategory = try fieldsContainer.decodeIfPresent(String.self, forKey: .subCategory)
         let brandName = try fieldsContainer.decodeIfPresent(String.self, forKey: .brandName)
         let modelName = try fieldsContainer.decodeIfPresent(String.self, forKey: .modelName)
         let productId = try fieldsContainer.decodeIfPresent(String.self, forKey: .productId)
         let packaging = try fieldsContainer.decodeIfPresent(String.self, forKey: .packaging)
         let marketingDates = try fieldsContainer.decodeIfPresent(String.self, forKey: .marketingDates)
         let storageTemperature = try fieldsContainer.decodeIfPresent(String.self, forKey: .storageTemperature)
         let healthMark = try fieldsContainer.decodeIfPresent(String.self, forKey: .healthMark)
         let infos = try fieldsContainer.decodeIfPresent(String.self, forKey: .infos)
         let saleGeoArea = try fieldsContainer.decodeIfPresent(String.self, forKey: .saleGeoArea)
         let distributor = try fieldsContainer.decodeIfPresent(String.self, forKey: .distributor)
         let reasonRecall = try fieldsContainer.decodeIfPresent(String.self, forKey: .reasonRecall)
         let risksIncurred = try fieldsContainer.decodeIfPresent(String.self, forKey: .risksIncurred)
         let healthRecommendations = try fieldsContainer.decodeIfPresent(String.self, forKey: .healthRecommendations)
         let additionalRiskDescription = try fieldsContainer.decodeIfPresent(
            String.self,
            forKey: .additionalRiskDescription)
         let actionsToTake = try fieldsContainer.decodeIfPresent(String.self, forKey: .actionsToTake)
         let contactNumber = try fieldsContainer.decodeIfPresent(String.self, forKey: .contactNumber)
         let compensationTerms = try fieldsContainer.decodeIfPresent(String.self, forKey: .compensationTerms)
         let endDateRecall = try fieldsContainer.decodeIfPresent(String.self, forKey: .endDateRecall)
         let otherInfos = try fieldsContainer.decodeIfPresent(String.self, forKey: .otherInfos)
         let imagesLink = try fieldsContainer.decodeIfPresent(String.self, forKey: .imagesLink)
         let flyerLink = try fieldsContainer.decodeIfPresent(String.self, forKey: .flyerLink)
         let dateRef = try fieldsContainer.decodeIfPresent(String.self, forKey: .dateRef)

          let record = Record(
            isPersistent: false,
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
            flyerLink: flyerLink,
            dateRef: dateRef
          )

         records.append(record)
      }
      self.records = records
   }
}
