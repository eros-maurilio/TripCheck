import Foundation
import Combine

protocol CombinationViewModelProtocol: ObservableObject {
    var combination: [DrugInteractionResponse] { get }
    var substances: [String] { get }

}

final class CombinationViewModel: CombinationViewModelProtocol {
    @Published var combination: [DrugInteractionResponse] = []
    var substances: [String]
    
    init(substances: [String]) {
        self.substances = substances
        loadCombination(drugA: substances[0], drugB: substances[1])
    }
    
   private func loadCombination(drugA: String, drugB: String) {
        APIService().getInteraction(drugA: drugA, drugB: drugB) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(combination):
                DispatchQueue.main.async {
                    self.combination = combination.data
                    print("Aqui \(combination)")
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
}
