//
//  SportsNews.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/28/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct SportsNews: View {
    @ObservedObject private var newsListVM = NewsListVM()
        
    init(){
        newsListVM.load(current: .sports)
    }
        
        var body: some View {
            VStack{
                SportsHeader()
                NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
            }
        }
    
}

struct SportsNews_Previews: PreviewProvider {
    static var previews: some View {
        SportsNews()
    }
}
