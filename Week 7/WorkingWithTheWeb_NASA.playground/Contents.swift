
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct PhotoInfo: Codable {
    
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum codingKey: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: any Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.copyright)
    }
    
}

extension URL {
    
    func withQueries(_ queries:[String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        
        return components?.url
        
    }
    
}

func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void)  {
    
    // you people fucked by moon and come to sun for your dust
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    // let query:[String: String] = ["api_key": "DEMO_KEY", "date": "2019-09-11"]
    let query:[String: String] = ["api_key": "DEMO_KEY", "date": "2024-09-03"]
    
    let url = baseURL.withQueries(query)!
    
    let task = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
           let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            // print(photoInfo)
            completion(photoInfo)
            
        } else {
            print("Either no data was returned or data was not decoded correctly!")
            completion(nil)
        }
        
        
        // let photoDictionary = try? jsonDecoder.decode([String: String].self, from: data) {
        // print(photoDictionary)
        // }
        
        
        // let string = String(data: data, encoding: .utf8) {
        // print(string)
        //}
        PlaygroundPage.current.finishExecution()
    }
    
    task.resume()
    
}

fetchPhotoInfo { (fetchedInfo) in print(fetchedInfo) }
