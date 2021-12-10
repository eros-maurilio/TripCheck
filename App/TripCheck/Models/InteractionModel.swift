import SwiftUI

struct DrugInteraction: Codable, Hashable {
    var status: String?
    var note: String?
    var interactionCategoryA: String?
    var interactionCategoryB: String?
}

struct Response: Codable {
    var err: Bool?
    var data: [DrugInteraction]?
    var url: String?
}
