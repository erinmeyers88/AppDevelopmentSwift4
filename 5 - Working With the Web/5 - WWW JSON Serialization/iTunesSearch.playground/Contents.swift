import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct StoreItem : Codable {
    var trackName: String
    var collectionName: String
    var releaseDate: String

    enum CodingKeys: String, CodingKey {
        case trackName
        case collectionName
        case releaseDate
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
       
        self.trackName = try valueContainer.decode(String.self, forKey: CodingKeys.trackName)
        self.collectionName = try valueContainer.decode(String.self, forKey: CodingKeys.collectionName)
        self.releaseDate = try valueContainer.decode(String.self, forKey: CodingKeys.collectionName)
        
    }

}

struct StoreItems : Codable {
    let results : [StoreItem]
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

let query: [String: String] = [
    "term": "Kelly Clarkson",
    "media": "music"
]


func fetchItems(matching query: [String:String], completion: @escaping ([StoreItem]?) -> Void) {
    let baseUrl = URL(string: "https://itunes.apple.com/search")!
    
   
    let url = baseUrl.withQueries(query)!
    
    let jsonDecoder = JSONDecoder()
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data, let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("Error")
            completion(nil)
        }
    }
    task.resume()
    }


fetchItems(matching: query) { (storeItem) in
    print(storeItem)
}

//PlaygroundPage.current.finishExecution()
