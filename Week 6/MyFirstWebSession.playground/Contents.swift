import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// let url = URL(string: "https://www.curtin.edu.au")!
// let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!

extension URL {
    func withQueries(_ queries:[String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}

// let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!

let baseURL = URL(string: "https://api.geodatasource.com/city")!

// let query: [String: String] = ["api_key": "DEMO_KEY", "date": "2024-09-03"]

// let url = baseURL.withQueries(query)!
let query: [String: String] = ["key": "https://api.geodatasource.com/v2/cities", "format": "json", "lat": "37.3861", "lng": "-122.084"]

let url = baseURL.withQueries(query)!

let task = URLSession.shared.dataTask(with: url) {
    (data, response, error) in
    
    if let data = data,
       let string = String(data: data, encoding: .utf8) {
        print(string)
        
        //print(data as NSData)
        
    }
    
    
    PlaygroundPage.current.finishExecution()
    
}
    
task.resume()
