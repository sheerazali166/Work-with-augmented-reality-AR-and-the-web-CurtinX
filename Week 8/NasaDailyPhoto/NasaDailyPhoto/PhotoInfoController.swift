//
//  PhotoInfoController.swift
//  NasaDailyPhoto
//
//  Created by Sheeraz on 9/3/24.
//

import Foundation


class PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY", "date": "2024-09-03"]
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data,
               let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
                // print(photoInfo)
            } else {
                print("Either no data was returned or data was not decoded correctly!")
                completion(nil)
            }
        }
        task.resume()
        
    }
}
