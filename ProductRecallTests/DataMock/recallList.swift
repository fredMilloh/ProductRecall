//
//  recallList.swift
//  ProductRecallTests
//
//  Created by fred on 22/04/2022.
//
@testable import ProductRecall

let listMock = [
    Record(count: Optional(4475), id: Optional("7ba4596e6d13fd2ae3af2a867c47bcc2addc7d31"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0179"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Lait et produits laitiers"), brandName: Optional("Les chèvres d\'Amandine"), modelName: Optional("Cabécou, gramat, montdoux, faisselle, fromages frais"), productId: Optional("06/04/2022, 07/04/2022 et 21/04/2022 Date limite de consommation 07/05/2022"), packaging: nil, marketingDates: Optional("Du 08/04/2022 au 18/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: Optional("82132001"), infos: nil, saleGeoArea: Optional("France entière"), distributor: Optional("Sarl aux bons fromages, chez le producteur, boucherie pinto, promocash Montauban,  ferme les pibouls,Gratiot SA Rungis."), reasonRecall: Optional("LISTERIA"), risksIncurred: Optional("Listeria monocytogenes (agent responsable de la listériose)"), healthRecommendations: Optional("Les personnes qui auraient consommé les « produits » mentionnés ci-dessus et qui présenteraient de la fièvre, isolée ou accompagnée de maux de tête, et des courbatures, sont invitées à consulter leur médecin traitant en lui signalant cette consommation.  Des formes graves avec des complications neurologiques et des atteintes maternelles ou fœtales chez la femme enceinte peuvent également parfois survenir. Les femmes enceintes ainsi que les personnes immunodéprimées et les personnes âgées doivent être particulièrement attentives à ces symptômes. La listériose est une maladie qui peut être grave et dont le délai d\'incubation peut aller jusqu\'à huit semaines."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer"), contactNumber: nil, compensationTerms: Optional("Echange"), endDateRecall: nil, otherInfos: nil, imagesLink: Optional("http://rappel.conso.gouv.fr/image/a72bd35b-640d-4a6e-9011-bdee0529fda0.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6903/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("569ace56282a74cb515e998365b8f7827d2b4959"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0177"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Noix et graines"), brandName: Optional("B&S CUISINE"), modelName: Optional("PISTACHE DECORTIQUEE sachet 250g B&S CUISINE"), productId: Optional("3580281252024 1006 Date limite de consommation 30/04/2023"), packaging: Optional("PAQUET 250g"), marketingDates: Optional("Du 09/03/2022 au 08/04/2022"), storageTemperature: Optional("Produit à conserver à température ambiante"), healthMark: nil, infos: nil, saleGeoArea: Optional("France entière"), distributor: Optional("magasins GRAND FRAIS"), reasonRecall: Optional("Présence de pesticides en quantité supérieure à la LMR de l\'UE"), risksIncurred: Optional("Dépassement des limites autorisées de pesticides"), healthRecommendations: nil, additionalRiskDescription: Optional("Présence de pesticides en quantité supérieure à la LMR de l\'UE"), actionsToTake: Optional("Ne plus consommer Ne plus utiliser le produit Rapporter le produit au point de vente Détruire le produit"), contactNumber: nil, compensationTerms: Optional("Remboursement Echange"), endDateRecall: Optional("samedi 21 mai 2022"), otherInfos: nil, imagesLink: Optional("http://rappel.conso.gouv.fr/image/de17a324-1f73-4809-9936-9620f42c9765.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6901/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("f5aeca0d733036c2fa768f262f51ee463b066504"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0172"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Plats préparés et snacks"), brandName: Optional("PAS DE MARQUE : FABRICATION MAISON"), modelName: Optional("coquille saint jacques vendue au rayon trad traiteur\r\ncoquille saint jacques x2 vendues au rayon traiteur en libre service"), productId: Optional("0206302000000   0208009000000 094 Date limite de consommation 16/04/2022"), packaging: Optional("vendue à l\'unité au rayon traiteur traditionnel \r\nvendues par 2 au rayon traiteur libre service."), marketingDates: Optional("Du 05/04/2022 au 13/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: nil, infos: nil, saleGeoArea: Optional("VENDU AU CENTRE E.LECLERC de LAMBALLE."), distributor: Optional("E.LECLERC DE LAMBALLE 66 rue mouexigné 22400 LAMBALLE"), reasonRecall: Optional("PRESENCE DE LISTERIA MONOCYTOGENES"), risksIncurred: Optional("Listeria monocytogenes (agent responsable de la listériose)"), healthRecommendations: Optional("Les personnes qui auraient consommé les « produits » mentionnés ci-dessus et qui présenteraient de la fièvre, isolée ou accompagnée de maux de tête, et des courbatures, sont invitées à consulter leur médecin traitant en lui signalant cette consommation.  Des formes graves avec des complications neurologiques et des atteintes maternelles ou fœtales chez la femme enceinte peuvent également parfois survenir. Les femmes enceintes ainsi que les personnes immunodéprimées et les personnes âgées doivent être particulièrement attentives à ces symptômes. La listériose est une maladie qui peut être grave et dont le délai d\'incubation peut aller jusqu\'à huit semaines."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente"), contactNumber: Optional("0296501130"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("lundi 20 juin 2022"), otherInfos: Optional("Pour tout renseignements complémentaire, veuillez contacter le 02.96.50.11.30"), imagesLink: Optional("http://rappel.conso.gouv.fr/image/6d92e2f2-3d62-4b05-b084-5ab692824d8e.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6896/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("36972afb3daaddfadfa1388f1747598b2e70ca07"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0171"), legalCharacter: Optional("Imposé par arrêté préfectoral"), category: Optional("Alimentation"), subCategory: Optional("Viandes"), brandName: Optional("SALAISONS DE LA VERNEDE"), modelName: Optional("PATE FOUR"), productId: Optional("LOT 11 LOT 14"), packaging: Optional("SOUS VIDE"), marketingDates: Optional("Du 15/03/2022 au 20/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: Optional("FR81124027CE"), infos: nil, saleGeoArea: Optional("France entière"), distributor: Optional("RAYGAL LACAUNE\r\nWEYDMANN RIOLS\r\nMAISON NEGRE LACAUNE\r\nCALAS LACAUNE\r\nMAISON MONTALET ST DENIS\r\nMAISON ENJALBAL LACAUNE\r\nMAISON MIMOSA PORTIRAGNES\r\nDEJEAN STEPHANIE VIVIERS LES MONTAGNES"), reasonRecall: Optional("SUSPICION DE LISTERIA MONOCYTOGENES"), risksIncurred: Optional("Listeria monocytogenes (agent responsable de la listériose)"), healthRecommendations: Optional("Les personnes qui auraient consommé les « produits » mentionnés ci-dessus et qui présenteraient de la fièvre, isolée ou accompagnée de maux de tête, et des courbatures, sont invitées à consulter leur médecin traitant en lui signalant cette consommation.  Des formes graves avec des complications neurologiques et des atteintes maternelles ou fœtales chez la femme enceinte peuvent également parfois survenir. Les femmes enceintes ainsi que les personnes immunodéprimées et les personnes âgées doivent être particulièrement attentives à ces symptômes. La listériose est une maladie qui peut être grave et dont le délai d\'incubation peut aller jusqu\'à huit semaines."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente"), contactNumber: Optional("0563370426"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("mardi 10 mai 2022"), otherInfos: Optional("ENSEMBLE DE LOTS CONCERNÉES"), imagesLink: Optional("http://rappel.conso.gouv.fr/image/44762f90-ff54-4e2e-966d-1a3bfed323fc.jpg http://rappel.conso.gouv.fr/image/55d17096-179e-43c9-ba9e-a075622a6d03.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6895/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("43a0570042672391615e9337de883e37125e568a"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0170"), legalCharacter: Optional("Imposé par arrêté préfectoral"), category: Optional("Alimentation"), subCategory: Optional("Viandes"), brandName: Optional("SALAISONS DE LA VERNEDE"), modelName: Optional("MELSATS"), productId: Optional("LOT 10 LOT 14"), packaging: Optional("SOUS VIDE"), marketingDates: Optional("Du 08/03/2022 au 20/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: Optional("FR81124027CE"), infos: nil, saleGeoArea: Optional("France entière"), distributor: Optional("MAISON HERVE TOULOUSE\r\nSARL SOVIT ALBI\r\nEUROCHARCUTERIE TOULOUSE\r\nWEYDMANN RIOLS"), reasonRecall: Optional("SUSPICION DE LISTERIA"), risksIncurred: Optional("Listeria monocytogenes (agent responsable de la listériose)"), healthRecommendations: Optional("Les personnes qui auraient consommé les « produits » mentionnés ci-dessus et qui présenteraient de la fièvre, isolée ou accompagnée de maux de tête, et des courbatures, sont invitées à consulter leur médecin traitant en lui signalant cette consommation.  Des formes graves avec des complications neurologiques et des atteintes maternelles ou fœtales chez la femme enceinte peuvent également parfois survenir. Les femmes enceintes ainsi que les personnes immunodéprimées et les personnes âgées doivent être particulièrement attentives à ces symptômes. La listériose est une maladie qui peut être grave et dont le délai d\'incubation peut aller jusqu\'à huit semaines."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente"), contactNumber: Optional("0563370426"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("dimanche 8 mai 2022"), otherInfos: Optional("ENSEMBLE DE LOTS CONCERNEES"), imagesLink: Optional("http://rappel.conso.gouv.fr/image/54da0e0b-1fe4-4533-8de8-bfe509518d88.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6894/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("df19afceb6447d4bee8e7fb651d449d4d9943632"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0169"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Viandes"), brandName: Optional("SALAISONS DE LA VERNEDE"), modelName: Optional("TRIPES"), productId: Optional("LOT 11/ LOT 12// LOT 14"), packaging: Optional("SOUS VIDE"), marketingDates: Optional("Du 15/03/2022 au 20/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: Optional("81124027CE"), infos: nil, saleGeoArea: Optional("France entière"), distributor: Optional("SARL CALAS LACAUNE\r\nMAISON MIMOSA PORTIRAGNES\r\nLE RAYGAL LACAUNE\r\nALBA FREDERIC LACAUNE\r\nLOU MAZEL LACAUNE\r\nMAISON HERVE TOULOUSE\r\nMAISON ENJALBAL LACAUNE"), reasonRecall: Optional("LISTERIA MONOCYTOGENES"), risksIncurred: Optional("Listeria monocytogenes (agent responsable de la listériose)"), healthRecommendations: Optional("Les personnes qui auraient consommé les « produits » mentionnés ci-dessus et qui présenteraient de la fièvre, isolée ou accompagnée de maux de tête, et des courbatures, sont invitées à consulter leur médecin traitant en lui signalant cette consommation.  Des formes graves avec des complications neurologiques et des atteintes maternelles ou fœtales chez la femme enceinte peuvent également parfois survenir. Les femmes enceintes ainsi que les personnes immunodéprimées et les personnes âgées doivent être particulièrement attentives à ces symptômes. La listériose est une maladie qui peut être grave et dont le délai d\'incubation peut aller jusqu\'à huit semaines."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente Détruire le produit"), contactNumber: Optional("0563370426"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("dimanche 1 mai 2022"), otherInfos: Optional("ENSEMBLE DE LOTS CONCERNEES"), imagesLink: Optional("http://rappel.conso.gouv.fr/image/5b006b32-a53b-49e2-a6d2-56d38f827ba8.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6893/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("0d56395b105c8fd36b892e2ec4ca82b711bd8d27"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0168"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Viandes"), brandName: Optional("Sans marque"), modelName: Optional("Merguez à griller vrac"), productId: Optional("0212601000000 Lot Fabrication 2022-109"), packaging: Optional("Vrac"), marketingDates: Optional("Du 19/04/2022 au 19/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: nil, infos: nil, saleGeoArea: Optional("E.Leclerc Creutzwald"), distributor: Optional("E.Leclerc Creutzwald"), reasonRecall: Optional("Suspicion présence de corps étranger"), risksIncurred: Optional("Inertes (verre, métal, plastique, papier, textile…)"), healthRecommendations: Optional("En raison du risque de blessures / effets indésirables suite à l\'ingestion de ce produit, par précaution il est recommandé aux personnes qui détiendraient des produits appartenant au(x) lot(s) décrit(s) ci-dessus de ne pas les consommer."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente Contacter le point de vente Contacter le service consommateur"), contactNumber: Optional("0387292333"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("lundi 2 mai 2022"), otherInfos: nil, imagesLink: Optional("http://rappel.conso.gouv.fr/image/d79381bb-b77c-4369-a2d4-8f0c13fb0f13.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6892/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("4e3bc4442bb17e9c99a776fdab939b8614c7198e"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0167"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Produits de la pêche et d\'aquaculture"), brandName: Optional("SANS MARQUE"), modelName: Optional("Blanquette de Cabillaud 800g"), productId: Optional("Date limite de consommation 17/04/2022"), packaging: Optional("barquette plastique de 800g"), marketingDates: Optional("Du 14/04/2022 au 17/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: nil, infos: nil, saleGeoArea: Optional("Régions: Hauts-de-France"), distributor: Optional("supermarché Match Villeneuve d\'Ascq Haute Borne"), reasonRecall: Optional("Présence éventuelle de corps étrangers"), risksIncurred: Optional("Inertes (verre, métal, plastique, papier, textile…)"), healthRecommendations: Optional("En raison du risque de blessures / effets indésirables suite à l\'ingestion de ce produit, par précaution il est recommandé aux personnes qui détiendraient des produits appartenant au(x) lot(s) décrit(s) ci-dessus de ne pas les consommer."), additionalRiskDescription: Optional("Morceaux de plastique"), actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente"), contactNumber: Optional("0374954440"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("mercredi 4 mai 2022"), otherInfos: nil, imagesLink: Optional("http://rappel.conso.gouv.fr/image/5e71a429-c01b-4193-b001-c526ebcad0f6.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6891/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("d1174fd32a78b7dea1bb1b8793e4db50fb19321b"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0163"), legalCharacter: Optional("Imposé par arrêté préfectoral"), category: Optional("Alimentation"), subCategory: Optional("Viandes"), brandName: Optional("SALAISONS DE LA VERNEDE"), modelName: Optional("BOUDINS LANGUES\r\nBOUDINS OIGNONS\r\nBOUDINS BRASSES\r\nBOUDINS"), productId: Optional("10-12-14"), packaging: Optional("SOUS VIDE"), marketingDates: Optional("Du 10/03/2022 au 15/04/2022"), storageTemperature: Optional("Produit à conserver au réfrigérateur"), healthMark: Optional("FR81124027CE"), infos: Optional("FR81124027 CE\r\nSALAISONS DE LA VERNEDE"), saleGeoArea: Optional("France entière"), distributor: Optional("VOIR INFORMATIONS COMPLEMENTAIRES"), reasonRecall: Optional("LISTERIA MONOCYTOGENES"), risksIncurred: Optional("Listeria monocytogenes (agent responsable de la listériose) Intoxication"), healthRecommendations: Optional("Les personnes qui auraient consommé les « produits » mentionnés ci-dessus et qui présenteraient de la fièvre, isolée ou accompagnée de maux de tête, et des courbatures, sont invitées à consulter leur médecin traitant en lui signalant cette consommation.  Des formes graves avec des complications neurologiques et des atteintes maternelles ou fœtales chez la femme enceinte peuvent également parfois survenir. Les femmes enceintes ainsi que les personnes immunodéprimées et les personnes âgées doivent être particulièrement attentives à ces symptômes. La listériose est une maladie qui peut être grave et dont le délai d\'incubation peut aller jusqu\'à huit semaines."), additionalRiskDescription: nil, actionsToTake: Optional("Ne plus consommer Rapporter le produit au point de vente"), contactNumber: Optional("0563370426"), compensationTerms: Optional("Remboursement"), endDateRecall: Optional("dimanche 8 mai 2022"), otherInfos: Optional("EUROCHARCUTERIE TOULOUSE\r\nLE RAYGAL LACAUNE\r\nMAISON NEGRE LACAUNE\r\nBOUCHERIE DU BARRY \r\nBOULANGERIE AGAE AVIGNONNET LAURAGUAIS\r\nBOUCHERIE LOU TERROIR 31000 TOULOUSE\r\nDEJEAN STEPHANIE VIVIERS LES MONTAGNES\r\nLECLERC CARCASSONNE"), imagesLink: Optional("http://rappel.conso.gouv.fr/image/2e16db4f-beb0-49a5-b4ed-44ee137b3d4f.jpg http://rappel.conso.gouv.fr/image/6761cec0-4fd4-4ffb-91d8-c63631540e34.jpg http://rappel.conso.gouv.fr/image/84fae9a9-d071-406f-9ec0-4016aed145e2.jpg http://rappel.conso.gouv.fr/image/747b095d-227d-4104-b454-93dce96252d1.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6887/Interne"), dateRef: Optional("2022-04")),
    Record(count: Optional(4475), id: Optional("8048f1784d010dd7f2e517b30289b682f62fd111"), isPersistent: false, timestamp: Optional("2022-04-22T08:00:07.781Z"), cardRef: Optional("2022-04-0162"), legalCharacter: Optional("Volontaire (sans arrêté préfectoral)"), category: Optional("Alimentation"), subCategory: Optional("Plats préparés et snacks"), brandName: Optional("LA PIZZA DE MANOSQUE"), modelName: Optional("Mini Pizza Jambon fromage"), productId: Optional("3424600001354 017/22 et 018/22 Date de durabilité minimale 31/07/2023 3424600001354 166/21 Date de durabilité minimale 31/12/2023"), packaging: Optional("Barquette de couleur blanche + film transparent"), marketingDates: Optional("Du 29/07/2021 au 04/04/2022"), storageTemperature: Optional("Produit à conserver au congélateur"), healthMark: nil, infos: Optional("9 mini pizzas au jambon fromage emballées dans une barquette compostable de couleur blanche. L\'ensemble étant emballé à l\'aide d\'un film transparent et identifié avec une étiquette adhésive mentionnant la liste d\'ingrédients, lot et DDM."), saleGeoArea: Optional("France entière"), distributor: Optional("Les points de ventes ECOMIAM"), reasonRecall: Optional("Il manque des informations sur la liste d\'ingrédients, au niveau des matières premières notamment la farine de blé. L’allergène  Blé  n\'est donc pas mentionné sur le produit."), risksIncurred: Optional("Substances allergisantes non déclarées"), healthRecommendations: nil, additionalRiskDescription: nil, actionsToTake: Optional("Rapporter le produit au point de vente"), contactNumber: Optional("0492705790"), compensationTerms: Optional("Autre (voir informations complémentaires)"), endDateRecall: Optional("jeudi 30 juin 2022"), otherInfos: Optional("Avoir au consommateur qui rapportera le produit concerné par le rappel."), imagesLink: Optional("http://rappel.conso.gouv.fr/image/6401d914-2843-4460-b222-96d7404a3dd3.jpg"), productsLink: nil, flyerLink: Optional("http://rappel.conso.gouv.fr/affichettePDF/6886/Interne"), dateRef: Optional("2022-04"))
]