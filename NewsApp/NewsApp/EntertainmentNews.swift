//
//  EntertainmentNews.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/29/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct EntertainmentNews: View {
    @ObservedObject private var newsListVM = NewsListVM()
        
    init(){
        newsListVM.load(current: .entertainment)
    }
    var body: some View {
        VStack{
            EntertainmentHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        }
    }
}

struct EntertainmentNews_Previews: PreviewProvider {
    static var previews: some View {
        EntertainmentNews()
    }
}
