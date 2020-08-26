//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gaurav Joshi on 6/22/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import SwiftUI

//This is the View Model- Portal between view and model
//Set means only emoji game can modify but everyone can see it


//Observable object only works for classes
class EmojiMemoryGame : ObservableObject{
    //Anytime something changes in var published lets know objectWillChange.send()
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards : emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    //Mark access to the model
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //Mark Intents
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
