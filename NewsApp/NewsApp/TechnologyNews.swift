//
//  TechnologyNews.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/29/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct TechnologyNews: View {
    @ObservedObject private var newsListVM = NewsListVM()
        
    init(){
        newsListVM.load(current: .tech)
    }
    var body: some View {
        VStack{
            TechnologyHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        }
    }
}

struct TechnologyNews_Previews: PreviewProvider {
    static var previews: some View {
        TechnologyNews()
    }
}
