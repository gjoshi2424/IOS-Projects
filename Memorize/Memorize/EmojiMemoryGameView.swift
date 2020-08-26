//
//  ContentView.swift
//  Memorize
//
//  Created by Gaurav Joshi on 6/22/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //ObservedObject redraws every time the variable is changed
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        //HStack arranges from left to right
        //Get rid of content if the inside is also curly brace w content
        Grid(viewModel.cards) { card in
            //Used to make multiple views-
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card : card)
                    
            }
            .padding(5)
        }
            .foregroundColor(Color.orange).padding()
       
    }
}

struct CardView: View{
    var card : MemoryGame<String>.Card
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: geometry.size)
            
        }
    }
    private func body(for size: CGSize) -> some View {
        ZStack(){
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                    Text(card.content)
                }
                else{
                    if !card.isMatched{
                    RoundedRectangle(cornerRadius:cornerRadius).fill()
                    }
                }
            }
        .font(Font.system(size: fontSize(for: size)))

        }
    
    
    //MARK- Drawing Constants
    private let cornerRadius:CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height) * fontScaleFactor
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
