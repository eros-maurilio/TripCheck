import SwiftUI

protocol InteractionConstructor {
    var gradient: [Color] { get }
    var foregroundColor: Color { get }
    var icon: Image { get }
}

enum InteractionType: String, InteractionConstructor {
    case dangerous = "Dangerous"
    case caution = "Caution"
    case unsafe = "Unsafe"
    case lowRiskDecrease = "Low Risk & Decrease"
    case lowRiskSinergy = "Low Risk & Synergy"
    case lowRiskNoSinergy = "Low Risk & No Synergy"
    
    var gradient: [Color] {
        switch self {
        case .dangerous:
            return [.dangerousTop, .dangerousBottom]
        case .caution:
            return [.cautionTop, .cautionBottom]
        case .unsafe:
            return [.unsafeTop, .unsafeBottom]
        case .lowRiskDecrease:
            return [.lowRiskDecreaseTop, .lowRiskDecreaseBottom]
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
            return .black
        case .unsafe:
            return .white
        case .lowRiskDecrease:
            return .black
        case .lowRiskSinergy:
            return .white
        case .lowRiskNoSinergy:
            return .black
        }
    }
    
    var icon: Image {
        switch self {
        case .dangerous:
            return Image.death
        case .caution:
            return Image.alert
        case .unsafe:
            return Image.heart
        case .lowRiskDecrease:
            return Image.decrease
        case .lowRiskSinergy:
            return Image.death
        case .lowRiskNoSinergy:
            return Image.death

        }
    }
}
