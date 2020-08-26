//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation


struct NewsViewModel{
    let news: News
    
    var author : String{
        return news.author ?? "Unkown"
    }
    
    var description: String{
        return news.description ?? ""
    }
    
    var title : String{
        return news.title ?? ""
    }

    var url : String {
        return news.url ?? ""
    }
    
    var urlToImage : String{
        return news.urlToImage ?? "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
}
