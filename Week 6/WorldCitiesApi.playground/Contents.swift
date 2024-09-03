import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let baseURL = URL(string: "https://geo-info.co/")!
let query: String = "-32.007000.115.895096"

let url = baseURL.appendingPathComponent(query)
print(url)

let task = URLSession.shared.dataTask(with: url) {
    (data, response, error) in
        if let data = data,
           let string = String(data: data, encoding: .utf8) {
            print(string)
        }
    PlaygroundPage.current.finishExecution()
}

task.resume()
