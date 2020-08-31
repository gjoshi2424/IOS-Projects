//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation
//Observable because we need to observe the new changes that are happening
class NewsListVM : ObservableObject{
    @Published var news = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    
    func load(current: Topic){
        getNews(current)
    }
    private func getNews(_ current: Topic){
        let networkManager = NetworkManager()
        networkManager.getNews(cur: current){ (newsArticles) in
            guard let news = newsArticles else{return}
            
            let newsVM = news.map(NewsViewModel.init)
            self.getImages(for: newsVM)
            DispatchQueue.main.async{
                self.news = newsVM
            }
            
        }
    }
    
    private func getImages(for news: [NewsViewModel]) {
        let nm = NetworkManager()
        news.forEach { n in
            guard !n.urlToImage.isEmpty else{return}
            
            nm.getImage(urlString: n.urlToImage){ (data) in
                DispatchQueue.main.async{
                    self.imageData[n.urlToImage] = data
                }
            }
        }
    }
}
