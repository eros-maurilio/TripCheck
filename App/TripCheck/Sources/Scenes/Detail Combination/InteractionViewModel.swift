import Combine
import SwiftUI

protocol InteractionViewModelProtocol: ObservableObject {
    var processedData: DrugInteractionResponse { get }
    var drugA: String { get }
    var drugB: String { get }
    var interactionType: InteractionType? { get }
    var alert: Bool { get set }
    
    func showAlert()
}

final class InteractionViewModel: InteractionViewModelProtocol {
    
    // MARK: - Atributes
    
    @Published var processedData: DrugInteractionResponse
    @Published var interactionType: InteractionType?
    @Published var alert: Bool
    
    // MARK: - Private Atributes
    
    private var combinationData: [DrugInteractionResponse]
    private var substances: [String]
    
    // MARK: - Computed Variables
    
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
        alert = false
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
    
    func showAlert() { alert = true }
}
