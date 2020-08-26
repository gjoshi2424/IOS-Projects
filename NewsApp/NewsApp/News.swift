//
//  News.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation

struct News : Decodable{
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct newsEnvelope: Decodable{
    let status : String
    let totalResults: Int
    let articles: [News]
}
