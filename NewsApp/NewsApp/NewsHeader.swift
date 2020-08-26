//
//  NewsHeader.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct NewsHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Image(systemName: "largecircle.fill.circle")
                Text("News").bold()
                Image(systemName: "plus")
                Spacer()
            }
            .foregroundColor(.black)
            .font(.largeTitle)
            
            Text("Top Headlines")
                .foregroundColor(.gray)
                .font(.largeTitle)
        }.padding(.horizontal)
            .padding(.vertical, 10)
    }
}

struct NewsHeader_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeader()
    }
}
