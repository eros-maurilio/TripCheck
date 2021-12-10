import SwiftUI

struct DrugInteractionResponse: Codable, Hashable {
    var status: String?
    var note: String?
    var interactionCategoryA: String?
    var interactionCategoryB: String?
}

struct Response: Codable {
    var err: Bool?
    var data: [DrugInteractionResponse]?
    var url: String?
}
