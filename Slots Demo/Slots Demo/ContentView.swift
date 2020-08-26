//
//  ContentView.swift
//  Slots Demo
//
//  Created by Gaurav Joshi on 7/12/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            //Background
            Rectangle()
            .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/225, blue: 76/225))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Swift UI Slots")
                    .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                //Credits counter
                Text("credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        
                        Spacer()
                    
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                        Spacer()
                    
                    }
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                        Spacer()
                    
                    }
                }
                Spacer()
                HStack(spacing: 20){
                    VStack{
                        Button(action: {
                        //Process a single win
                                          
                         self.processResults()
                        }) {
                         Text("Spin")
                       .bold()
                       .padding(.all, 10)
                       .padding([.leading, .trailing], 30)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(20)
                        }
                        Text("\(betAmount) credits").padding(.top, 10)
                            .font(.footnote)
                    }
                    VStack{
                        Button(action: {
                        //Process a single win
                                          
                         self.processResults(true)
                        }) {
                         Text("Max Spin")
                       .bold()
                       .padding(.all, 10)
                       .padding([.leading, .trailing], 30)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(20)
                        }
                        Text("\(betAmount * 5) credits").padding(.top, 10)
                            .font(.footnote)
                    }
                }
                Spacer()
            }
        }
    }
    
    func processResults(_ isMax: Bool = false){
        self.backgrounds = self.backgrounds.map { _  in Color.white} //map creates a new array
        
        if isMax{
            //spin all the cards
            self.numbers = self.numbers.map({ _ in
                Int.random(in: 0...self.symbols.count-1)
            })
        }
        else{
            //Spin the middle row
            self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
        }
        processWin(isMax)
    }
    
    func processWin(_ isMax: Bool = false){
        var matches = 0
        if !isMax{
            //Process for single spin
            if (self.numbers[3] == self.numbers[4] && self.numbers[3] == self.numbers[5]){
                    matches += 1
                       //Update backgrounds to green
                    self.backgrounds[3] = Color.green
                    self.backgrounds[4] = Color.green
                    self.backgrounds[5] = Color.green
                       
                   }
        }
        else{
            //processing for max spin
            
            //Top row
            if (self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]){
             matches += 1
                //Update backgrounds to green
             self.backgrounds[0] = Color.green
             self.backgrounds[1] = Color.green
             self.backgrounds[2] = Color.green
                
            }
            
            //Middle Row
            if (self.numbers[3] == self.numbers[4] && self.numbers[3] == self.numbers[5]){
             matches += 1
                //Update backgrounds to green
             self.backgrounds[3] = Color.green
             self.backgrounds[4] = Color.green
             self.backgrounds[5] = Color.green
                
            }
            
            //Bottom Row
            if (self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8]){
             matches += 1
                //Update backgrounds to green
             self.backgrounds[6] = Color.green
             self.backgrounds[7] = Color.green
             self.backgrounds[8] = Color.green
                
            }
            
            //Top left to bottom right
            if (self.numbers[0] == self.numbers[4] && self.numbers[4] == self.numbers[8]){
             matches += 1
                //Update backgrounds to green
             self.backgrounds[0] = Color.green
             self.backgrounds[4] = Color.green
             self.backgrounds[8] = Color.green
                
            }
            
            //Top right to bottom left
            if (self.numbers[02] == self.numbers[4] && self.numbers[4] == self.numbers[6]){
                        matches += 1
                           //Update backgrounds to green
                        self.backgrounds[0] = Color.green
                        self.backgrounds[4] = Color.green
                        self.backgrounds[6] = Color.green
                           
                       }
            //Check matches and distribute credits
            if matches > 0 {
                //Atleast one win
                self.credits = matches * 2 * self.betAmount
            }
            else if !isMax{
                //0 wins single spin
                self.credits -= self.betAmount
            }
            else{
                //0 wins max spin
                self.credits -= 5 * self.betAmount
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
