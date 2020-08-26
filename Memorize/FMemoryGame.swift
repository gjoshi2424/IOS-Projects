//
//  FMemoryGame.swift
//  Memorize
//
//  Created by Gaurav Joshi on 6/22/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation

//Declare cont care types up here
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
   private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{cards.indices.filter { cards[$0].isFaceUp}.only}
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
                
                }
            }
        }
    
    //For struct if it is changing its own struct then u need to make it a mutating func
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        if let chosenIndex : Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true //Do this because struct will make a copy
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            

        }
    }
    
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
