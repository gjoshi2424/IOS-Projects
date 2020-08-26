//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gaurav Joshi on 7/15/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    var body: some View {
    
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                VStack{
                    Text("Tap flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                    .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number]).renderingMode(.original)
                        .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Current Score: \(self.score)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }
            .alert(isPresented: $showingScore){
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                    })
            }
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 5
        }
        else{
            scoreTitle = "Wrong! Thats's the flag of \(countries[number])"
            score -= 5
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
