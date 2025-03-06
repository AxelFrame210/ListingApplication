//
//  ContentView.swift
//  ListingApplication
//
//  Created by Admin on 21/2/25.
//View

import SwiftUI
import UIKit


struct ContentView: View {
    //Pointing to an instance of the View Model
    var gameModel: EmojiMemorizeGame
    let iconArray = ["🏆", "⭐️", "❤️", "♠️", "❤️","🏆", "⭐️", "❤️", "♠️"]
    @State var cardCount: Int = 4
        
    var body: some View {
        
        gameTitle
 
        VStack {
            
            cardList
            
            HStack(spacing: 30) {
                cardRemover
                cardCountText
                cardAdder
            }.padding()
        }
    }
    
    var cardList: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50)),GridItem(.adaptive(minimum: 50)) ]) {
            
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(icon: iconArray[index], name: "World", isSelected: true)
            }
        }.padding()
       
    }
    
    var cardCountText: some View {
        Text("Cards: \(cardCount)").font(.system(size:30))
    }
    
    func cardAdjusterButton(by offset: Int, buttonLable: Image, disable :Bool) -> some View {
        return Button(action: {
            cardCount += offset
        }, label: {buttonLable.imageScale(.large).font(.system(size: 30))}
        ).disabled(disable)
    }
    
    var cardAdder: some View {
        cardAdjusterButton(by: 1, buttonLable: Image(systemName:"rectangle.stack.fill.badge.plus"), disable: cardCount > iconArray.count - 1)
    }
    
    var cardRemover: some View {
        cardAdjusterButton(by: -1, buttonLable: Image(systemName: "rectangle.stack.fill.badge.minus"), disable: cardCount < 2)
    }

    var gameTitle: some View {
            HStack(alignment: .center, content: {
                Text("🧠").font(.system(size: 40))
                Text("Memorize").font(.system(size: 40, weight: .bold))
            })
        }
    var revealCards: some View {
        Text("Reveal Cards").font(.system(size: 30))
    }
    // A core component should be a struct  for better readability
    struct CardView : View {
        var icon: String
        var name: String
        @State var isSelected = true
        
        var body: some View {
            
            ZStack {
                let rec = RoundedRectangle(cornerRadius: 10)
                rec.fill(Color.white).strokeBorder(lineWidth: 1)
                
                Group {
                    VStack() {
                        Text(icon)
                        Text("\(name)")
                    }
                }
                
                rec.fill(Color.white).strokeBorder(lineWidth: 2).fill(Color.blue).opacity(isSelected ? 0 : 1)
            }
            .onTapGesture {
                isSelected.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
