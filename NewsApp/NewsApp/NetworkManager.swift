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
    
    //private let usTopHeadline = "top-headlines?country=us"
    
    
    private func getTopicURL(on current: Topic) -> String{
        switch current{
            
            case .home:
                return "top-headlines?country=us"
            case .sports:
                return "top-headlines?country=us&category=sports"
            case .business:
                return "top-headlines?country=us&category=business"
            case .entertainment:
                return "top-headlines?country=us&category=entertainment"
            case .tech:
                return "top-headlines?country=us&category=technology"
            case .health:
                return "top-headlines?country=us&category=health"
        }
    }
    
    func getNews(cur: Topic, completion: @escaping (([News]?) -> Void)){
        let urlString = "\(baseUrlString)\(self.getTopicURL(on: cur))&apiKey=\(API.key)"
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
