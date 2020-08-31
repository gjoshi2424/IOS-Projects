//
//  BusinessNews.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/29/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct BusinessNews: View {
    @ObservedObject private var newsListVM = NewsListVM()
        
    init(){
        newsListVM.load(current: .business)
    }
    
    var body: some View {
        VStack{
            BusinessHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
            }
        }
    }


struct BusinessNews_Previews: PreviewProvider {
    static var previews: some View {
        BusinessNews()
    }
}
