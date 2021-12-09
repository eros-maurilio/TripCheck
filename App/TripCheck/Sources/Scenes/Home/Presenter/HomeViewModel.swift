import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    func substanceSelection(substance: String)
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var selectedSubstances: [String] = []
    @Published var buttonState: Bool = false
    let maxNumberOfSubstances = 2
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
            buttonState = true
        } else {
            buttonState = false
        }
    }
}
