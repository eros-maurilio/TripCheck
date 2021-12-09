import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var selectedSubstances: [String] { get set }
    var isTheButtonVisible: Bool { get }
    var substancesList: [String] { get }
    
    func substanceSelection(substance: String)
    func showButton()
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var selectedSubstances: [String] = []
    @Published var isTheButtonVisible: Bool = false
    private let maxNumberOfSubstances = 2
    private var substancesModel = TypeOf()
    var substancesList: [String] { substancesModel.substances }
    
    private var substancesCountEquals: Bool { selectedSubstances.count == maxNumberOfSubstances}
    
    private var substancesCountLessThen: Bool { selectedSubstances.count < maxNumberOfSubstances}
    
    private func Filter(_ substance: String) -> Bool {
        if selectedSubstances.contains(substance) {
            selectedSubstances = selectedSubstances.filter { $0 != substance}
             return true
        }
        return false
    }
    
    private func Remove(_ substance: String) {
        if substancesCountEquals {
            selectedSubstances.removeFirst()
        }
    }
    
    private func Append(_ substance: String) {
        if substancesCountLessThen {
            selectedSubstances.append(substance)
        }
    }
    
    func substanceSelection(substance: String) {
        if Filter(substance) { return }
        Remove(substance)
        Append(substance)
        
    }
    
    func showButton() {
        if substancesCountEquals {
            isTheButtonVisible = true
        } else {
            isTheButtonVisible = false
        }
    }
}
