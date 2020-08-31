//
//  BusinessHeader.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/29/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct BusinessHeader: View {
    var body: some View {
         VStack(alignment: .leading, spacing: 0){
                HStack{
                    Text("Business")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    Spacer()
                }
                   
                   
                   
               }.padding(.horizontal)
                   .padding(.vertical, 10)
    }
}

struct BusinessHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessHeader()
    }
}
