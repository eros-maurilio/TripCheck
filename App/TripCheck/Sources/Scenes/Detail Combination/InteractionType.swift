import SwiftUI

protocol InteractionConstructor {
    var status: String { get }
    var gradient: [Color] { get }
    var foregroundColor: Color { get }
}

enum InteractionType: InteractionConstructor {
    case dangerous
    case caution
    case unsafe
    case lowRiskDecrease
    case lowRiskSinergy
    case lowRiskNoSinergy
    
    var status: String {
        switch self {
        case .dangerous:
           return "Dangerous"
        case .caution:
            return "Caution"
        case .unsafe:
            return "Unsafe"
        case .lowRiskDecrease:
            return "Low Risk & Decrease"
        case .lowRiskSinergy:
            return "Low Risk & Synergy"
        case .lowRiskNoSinergy:
            return "Low Risk & No Synergy"
        }
    }
    
    var gradient: [Color] {
        switch self {
        case .dangerous:
            return [.dangerousTop, .dangerousBottom]
        case .caution:
            return [.cautionTop, .cautionBottom]
        case .unsafe:
            return [.unsafeTop, .unsafeBottom]
        case .lowRiskDecrease:
            return [.lowRiskDecreaseTop, .lowRiskSinergyBottom]
        case .lowRiskSinergy:
            return [.lowRiskSinergyTop, .lowRiskSinergyBottom]
        case .lowRiskNoSinergy:
            return [.lowRiskNoSinergyTop, .lowRiskNoSinergyBottom]
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .dangerous:
            return .white
        case .caution:
            return .white
        case .unsafe:
            return .black
        case .lowRiskDecrease:
            return .black
        case .lowRiskSinergy:
            return .white
        case .lowRiskNoSinergy:
            return .black
        }
    }
}
