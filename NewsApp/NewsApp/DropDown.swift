//
//  DropDown.swift
//  NewsApp
//
//  Created by Gaurav Joshi on 8/29/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

enum currentSheet{
    case Home, Sports, Business, Entertainment, Technology, Health
}

struct DropDown: View {
    @State private var clicked = false
    @State private var selection = false
    @State private var active: currentSheet = .Home
    var body: some View {
        VStack(){
            VStack(spacing: 5){
                HStack(){
                    Image(systemName: "largecircle.fill.circle")
                    .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                }.onTapGesture {
                    self.clicked.toggle()
                }
                if clicked{
                    
                    Button(action: {
                        self.selection.toggle()
                        self.active = .Sports
                    }){
                        Text("Sports")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 100, height: 50)
                            .scaledToFill()
                        
                    }
                    Button(action: {
                        self.selection.toggle()
                        self.active = .Business
                    }){
                        Text("Business")
                            .font(.headline)
                            .bold()
                            .frame(width: 100, height: 50)
                            .scaledToFill()
                        
                    }
                    .foregroundColor(.white)
                    
                    Button(action: {
                        self.selection.toggle()
                        self.active = .Entertainment
                    }){
                        Text("Entertainment")
                            .font(.headline)
                            .bold()
                            .frame(width: 120, height: 50)
                            .scaledToFill()
                        
                    }
                    .foregroundColor(.white)
                    
                    Button(action: {
                        self.selection.toggle()
                        self.active = .Technology
                    }){
                        Text("Tech")
                            .font(.headline)
                            .bold()
                            .frame(width: 120, height: 50)
                            .scaledToFill()
                        
                    }
                    .foregroundColor(.white)
                        
                    Button(action: {
                        self.selection.toggle()
                        self.active = .Health
                    }){
                        Text("Health")
                            .font(.headline)
                            .bold()
                            .frame(width: 120, height: 50)
                            .scaledToFill()
                        
                    }
                    .foregroundColor(.white)
                    
                    
                    .sheet(isPresented: $selection){
                        if(self.active == .Sports){
                            SportsNews()
                        }
                        else if(self.active == .Business){
                            BusinessNews()
                        }
                        else if(self.active == .Entertainment){
                            EntertainmentNews()
                        }
                        else if(self.active == .Technology){
                            TechnologyNews()
                        }
                        else{
                            HealthNews()
                        }
                    }
                    
                    
                }
            }
            .padding(5)
            .background(Color.red)
            .animation(.spring())
        }
    }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
