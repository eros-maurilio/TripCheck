import SwiftUI

class JSONInteractionViewModel: ObservableObject {
    @Published var data: [DrugInteraction]? = []

    func fetchData(subsA: String, subsB: String) {
        
        guard let url = URL(string: "https://tripbot.tripsit.me/api/tripsit/getInteraction?drugA=\(subsA)&drugB=\(subsB)") else { return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, _) in
            guard let jsonData = data else { return }
            
            // internal API Error
            let response = res as! HTTPURLResponse
            
            // Status code
            if response.statusCode == 404 {
                print("Error API")
                
                return
            }
            
            // Fetching Data
            
            do {
                let responses = try! JSONDecoder().decode(Response.self, from: jsonData)
                guard let interaction = responses.data else { return }
                print(interaction)
                
                DispatchQueue.main.async {
                    self.data = interaction
                }
            } catch {
                print(error)
            }
            
        }
        .resume()
    }
}
