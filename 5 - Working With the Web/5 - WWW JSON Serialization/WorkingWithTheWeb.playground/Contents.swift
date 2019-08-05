import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!

let query: [String: String] = [
    "api_key": "DEMO_KEY",
    "date": "2011-07-13"
]

let url = baseUrl.withQueries(query)!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data, let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}

task.resume()


 
