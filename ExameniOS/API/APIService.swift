//
//  APIService.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import Foundation

class APIService: NSObject {
    private let getGraphicsData = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
    
    func apiGetGraphicsData(completion: @escaping (CommentsPostResponse) -> ()) {
        let myURL = URL(string: "\(self.getGraphicsData)")
        URLSession.shared.dataTask(with: myURL!) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let storeData = try! jsonDecoder.decode(CommentsPostResponse.self, from: data)
                completion(storeData)
            }
        }.resume()
    }
}
