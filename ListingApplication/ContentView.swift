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
        VStack (content: {
            gameTitle(gameName: "Memorize", gameLogo: "🧠")
            
        }).padding()
        VStack {
            HStack{
                ForEach(0..<cardCount, id: \.self) {index in
                    CardView(icon: iconArray[index], name: "World", isSelected: true)
                }
               
            }.padding()
            
            HStack{
    
                Button (action: {
                    cardCount += 1
                }, label: {Image(systemName: "rectangle.stack.fill.badge.minus").imageScale(.large)
                    .font(.system(size: 30))})
                
                Spacer()
                
                Button (action: {
                    cardCount -= 1
                }, label: {Image(systemName: "rectangle.stack.fill.badge.minus").imageScale(.large)
                    .font(.system(size: 30))})

            }.padding()
            
        }
        
       
    }
}


struct gameTitle: View {
    let gameName: String
    let gameLogo: String
    
    var body: some View {
        HStack(alignment: .center, content: {
            Text(gameLogo).font(.system(size: 40))
            Text(gameName).font(.system(size: 40, weight: .bold))
        })
      
    }
}
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

#Preview {
    ContentView()
}
