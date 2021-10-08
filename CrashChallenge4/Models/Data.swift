//
//  Data.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 08/10/21.
//

import SwiftUI

struct DrugInteraction: Decodable {
    var Status: String?
    var Note: String?
    var interactionCategoryA: String?
    var interactionCategoryB: String?
}

struct Response: Decodable {
    var err: Bool?
    var data: [DrugInteraction]?
}

class Api {
    func getSubstancesInfo(completion: @escaping ([DrugInteraction]) -> ()) {
        guard let url = URL(string: "https://tripbot.tripsit.me/api/tripsit/getInteraction?drugA=cocaine&drugB=lsd") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let responses = try! JSONDecoder().decode(Response.self, from: data!)
            guard let interaction = responses.data else { return }
        
            DispatchQueue.main.async {
                completion(interaction)
            }
        }
        .resume()
    }
}
