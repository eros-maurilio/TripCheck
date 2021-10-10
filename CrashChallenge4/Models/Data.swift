//
//  Data.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 08/10/21.
//

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
}

class Api {
    func getSubstancesInfo(subsA: String, subsB: String,completion: @escaping ([DrugInteraction]) -> ()) {
        guard let url = URL(string: "https://tripbot.tripsit.me/api/tripsit/getInteraction?drugA=\(subsA)&drugB=\(subsB)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let responses = try! JSONDecoder().decode(Response.self, from: data!)
            guard let interaction = responses.data else { return }
            print(interaction)
            DispatchQueue.main.async {
                completion(interaction)
            }
        }
        .resume()
    }
}
