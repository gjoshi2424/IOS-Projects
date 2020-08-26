//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation

class NetworkManager {
    private let baseUrlString = "https://newsapi.org/v2/"
    
    private let usTopHeadline = "top-headlines?country=us"
    
    func getNews(completion: @escaping (([News]?) -> Void)){
        let urlString = "\(baseUrlString)\(usTopHeadline)&apiKey=\(API.key)"
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let newsRes = try? JSONDecoder().decode(newsEnvelope.self, from: data)
            newsRes == nil ? completion(nil): completion(newsRes!.articles)
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void){
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
