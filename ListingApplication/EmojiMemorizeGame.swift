//
//  EmojiMemorizeGame.swift
//  ListingApplication
//
//  Created by Admin on 5/3/25.
//
// View-Model

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["🏆", "⭐️", "♠️", "❤️"][index]
}
class EmojiMemorizeGame{
    //private is preventing View from accessing this var
    //The
    private var model : MemorizeGame<String> = MemorizeGame<String>(pairsOfCards: 4, cardContentFactory: createCardContent)
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }

    func choose (_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
}
