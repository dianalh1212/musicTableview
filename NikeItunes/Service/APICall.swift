//
//  APICall.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import Foundation

class APICall {
    static let shared = APICall()
    var session: URLSession?
    
    static func getMusics(completion: @escaping (_ responseData: ResponseModel) -> ()) {
        let url = String(format: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json")
        guard let serviceUrl = URL(string: url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (responseData, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = responseData,
                let res = try? JSONDecoder().decode(ResponseModel.self, from: data) else {
                    return
            }
            DispatchQueue.main.async {
                completion(res)
            }
        }
        task.resume()
    }
}
