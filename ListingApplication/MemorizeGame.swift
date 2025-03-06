//
//  MemorizeGame.swift
//  ListingApplication
//
//  Created by Admin on 5/3/25.
//Model

import Foundation

struct MemorizeGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>() //Array is a struct, having a free init, add parenthesis to initialize
        
        //  initialize the cardContent but doesn't know the type for it? we are using a generic type
        // => Pass the content as type: function, so that it can use the init
        
        for index in 0..<pairsOfCards {
            let cardContent = cardContentFactory(index)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
    }
}
