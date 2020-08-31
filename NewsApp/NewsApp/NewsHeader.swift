//
//  NewsHeader.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/25/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct NewsHeader: View {
    @State var selection: String? = nil
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                DropDown()
                Text("G's News").bold()
                Spacer()
            }
            .foregroundColor(.black)
            .font(.largeTitle)
            
            Text("Top US Headlines")
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
