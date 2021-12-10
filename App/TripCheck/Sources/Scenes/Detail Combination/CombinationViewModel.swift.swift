import Foundation

protocol CombinationViewModelProtocol: ObservableObject {
    var combination: [DrugInteractionResponse] { get }
    
    func loadCombination(drugA: String, drugB: String)
}

final class CombinationViewModel: CombinationViewModelProtocol {
    @Published var combination = [DrugInteractionResponse]()
    
    
    func loadCombination(drugA: String, drugB: String) {
        APIService().getInteraction(drugA: drugA, drugB: drugB) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(combination):
                DispatchQueue.main.async {
                    self.combination = combination.data!
                }
                
            case let .failure(_):
                print("error")
            }
        }
    }
}
