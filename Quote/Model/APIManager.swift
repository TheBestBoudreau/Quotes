//
//  APIManager.swift
//  Quotes
//
//  Created by Tyler Boudreau on 2018-05-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

import Foundation

class APIManager {
    //Make GET request
    func fetchQuote(endPoint: String, completion: @escaping (Data?, Error?)->(Void)){
        let url = URL(string: "\(endPoint)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print("no data \(String(describing: error?.localizedDescription))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("no response \(String(describing: error?.localizedDescription))")
                return
            }
            guard response.statusCode == 200 else {
                return
            }
            completion(data, error)
        }
            dataTask.resume()
        }
    
}
