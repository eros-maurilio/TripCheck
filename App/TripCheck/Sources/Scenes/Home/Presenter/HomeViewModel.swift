import Foundation
import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var selectedSubstances: [String] { get set }
    var isTheButtonVisible: Bool { get }
    var substancesList: [String] { get }
    
    func substanceSelection(substance: String)
    func showButton()
}

final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Published Variables
    
    @Published var selectedSubstances: [String]
    @Published var isTheButtonVisible: Bool
    
    // MARK: - Private Atributes
    private let maxNumberOfSubstances = 2
    private var substancesModel = TypeOf()
    private var substancesCountEquals: Bool { selectedSubstances.count == maxNumberOfSubstances}
    private var substancesCountLessThen: Bool { selectedSubstances.count < maxNumberOfSubstances}
    
    // MARK: - Public Variable
    
    var substancesList: [String] { substancesModel.substances }
    
    // MARK: - Class Instance
    
    init() {
        selectedSubstances = [String]()
        isTheButtonVisible = false
    }
    
    // MARK: - View properties Exchanger
    
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
    
    // MARK: - Helper Methods
    
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
}
