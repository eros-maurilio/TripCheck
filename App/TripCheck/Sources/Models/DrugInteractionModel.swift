import SwiftUI

struct DrugInteractionResponse: Codable, Hashable {
    var status: String
    var note: String?
    var interactionCategoryA: String
    var interactionCategoryB: String
}

struct Response: Codable {
    var data: [DrugInteractionResponse]
}
