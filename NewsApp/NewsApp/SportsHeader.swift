//
//  SportsHeader.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/28/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct SportsHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text("Sports")
                .foregroundColor(.gray)
                .font(.largeTitle)
                Spacer()
            }
            
            
            
        }.padding(.horizontal)
            .padding(.vertical, 10)
    }
}

struct SportsHeader_Previews: PreviewProvider {
    static var previews: some View {
        SportsHeader()
    }
}
