import Combine
import SwiftUI

protocol CombinationViewModelProtocol: ObservableObject {
    var processedData: DrugInteractionResponse { get }
    var substances: [String] { get }
    var drugA: String { get }
    var drugB: String { get }
    var interactionType: InteractionType? { get }
}

final class CombinationViewModel: CombinationViewModelProtocol {
    
    // MARK: - Atributes
    @Published var processedData: DrugInteractionResponse
    @Published var interactionType: InteractionType?
    var substances: [String]
    
    // MARK: - Computed Variables
    
    private var combinationData: [DrugInteractionResponse]
    var drugA: String { substances.safeElement(atIndex: 0) ?? "" }
    var drugB: String { substances.safeElement(atIndex: 1) ?? "" }
    
    // MARK: - Life Cycle
    
    init(substances: [String]) {
        self.substances = substances
        combinationData = []
        processedData = DrugInteractionResponse(status: String(),
                                                note: String(),
                                                interactionCategoryA: String(),
                                                interactionCategoryB: String())
        loadCombination(drugA: drugA, drugB: drugB)
    }
    
    // MARK: - Combination Method
    
    private func loadCombination(drugA: String, drugB: String) {
        APIService().getInteraction(drugA: drugA, drugB: drugB) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(combination):
                DispatchQueue.main.async {
                    self.combinationData = combination.data
                    
                    guard let combination = self.combinationData.first else { return }
                    
                    self.interactionType = InteractionType(rawValue: combination.status)
                    
                    self.processedData = DrugInteractionResponse(status: combination.status,
                                                                 note: combination.note ?? Localizable.Combination.Note.empty,
                                                                 interactionCategoryA: combination.interactionCategoryA,
                                                                 interactionCategoryB: combination.interactionCategoryB)
                }
                
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}
