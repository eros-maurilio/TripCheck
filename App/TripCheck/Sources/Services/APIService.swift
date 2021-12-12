import SwiftUI

typealias IntecationDataWrapperResult = ((Result<Response, NSError>) -> Void)

enum EndPoint {
    static let getInteraction = Strings.Api.Url.getInteraction
}

class APIService: ObservableObject {
    private var baseURL = Strings.Api.Url.base
    private var sharedSessions: URLSession { URLSession.shared }
    
    func getInteraction(drugA: String, drugB: String, completion: @escaping (IntecationDataWrapperResult)) {
        guard let baseURL = URL(string: baseURL) else { return }
        
        var components = URLComponents(url: baseURL.appendingPathComponent(EndPoint.getInteraction), resolvingAgainstBaseURL: true)
        
        let path = [
            URLQueryItem(name: Strings.Api.Query.drugA, value: drugA),
            URLQueryItem(name: Strings.Api.Query.drugB, value: drugB)
        ]
        
        components?.queryItems = path
        
        guard let url = components?.url else {
            completion(.failure(NSError(domain: "", code: 001, userInfo: ["Message": "Failed to create URL!"])))
            return
        }
        
        let task = sharedSessions.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(NSError(domain: "", code: 002, userInfo: ["Message": error.localizedDescription])))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 003, userInfo: ["Message": "Failed to load the data"])))
                return
            }
                        
            guard let interaction = try? JSONDecoder().decode(Response.self, from: data) else {
                completion(.failure(NSError(domain: "", code: 004, userInfo: ["Message": "Can't parse JSON"])))
                return
            }
            completion(.success(interaction))
            print(interaction)
            return
        }
        task.resume()
    }
}
