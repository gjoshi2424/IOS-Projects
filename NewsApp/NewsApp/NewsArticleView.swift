//
//  NewsArticleView.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct NewsArticleView: View {
    var newsUrl: String
    var body: some View {
        SwiftUIWebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}


