import Foundation
import Combine
import SwiftUI

protocol CombinationViewModelProtocol: ObservableObject {
    var combination: [DrugInteractionResponse] { get }
    var substances: [String] { get }
    var drugA: String { get }
    var drugB: String { get }
}

final class CombinationViewModel: CombinationViewModelProtocol {
    // MARK: - Atributes
    
    @Published var combination: [DrugInteractionResponse]
    var substances: [String]
    
    // MARK: - Computed Variables
    
    var drugA: String { substances.safeElement(atIndex: 0) ?? "" }
    var drugB: String { substances.safeElement(atIndex: 1) ?? "" }
    
    // MARK: - Life Cycle
    
    init(substances: [String]) {
        self.substances = substances
        combination = []
        loadCombination(drugA: drugA, drugB: drugB)
    }
    
    // MARK: - Combination Method
    
   private func loadCombination(drugA: String, drugB: String) {
        APIService().getInteraction(drugA: drugA, drugB: drugB) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(combination):
                DispatchQueue.main.async {
                    self.combination = combination.data
                }
                
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}
