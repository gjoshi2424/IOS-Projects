//
//  HealthNews.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/29/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct HealthNews: View {
    @ObservedObject private var newsListVM = NewsListVM()
        
    init(){
        newsListVM.load(current: .health)
    }
    var body: some View {
        VStack{
            HealthHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        }
    }
}

struct HealthNews_Previews: PreviewProvider {
    static var previews: some View {
        HealthNews()
    }
}
