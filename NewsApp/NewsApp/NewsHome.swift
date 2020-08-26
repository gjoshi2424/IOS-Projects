//
//  NewsHome.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct NewsHome: View {
    //Listen for changes
    @ObservedObject private var newsListVM = NewsListVM()
    
    init(){
        newsListVM.load()
    }
    
    var body: some View {
        VStack{
            NewsHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
