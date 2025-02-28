//
//  ContentView.swift
//  ListingApplication
//
//  Created by Admin on 21/2/25.
//

import SwiftUI
import UIKit


struct ContentView: View {
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
        
        HStack {
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

    // A core component should be a struct  for better readability
    struct CardView : View {
        var icon: String
        var name: String
        @State var isSelected = true
        
        var body: some View {

            ZStack {
                let rec = RoundedRectangle(cornerRadius: 10)
                
                if isSelected {
                   rec.strokeBorder(lineWidth: 1)
                    VStack() {
                        Text(icon)
                        Text("\(name)")
                    }
                }
                else {
                    rec.fill(Color.blue).strokeBorder(lineWidth: 1)
                }
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
