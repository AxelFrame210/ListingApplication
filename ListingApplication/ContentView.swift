//
//  ContentView.swift
//  ListingApplication
//
//  Created by Admin on 21/2/25.
//

import SwiftUI
import UIKit


struct ContentView: View {
    let iconArray = ["🏆", "⭐️", "❤️", "♠️"]
    var body: some View {
        VStack () {
            gameTitle(gameName: "Memorize", gameLogo: "🧠")
           
            
        }.padding()
        
            HStack{
                ForEach(iconArray.indices, id: \.self) {index in
                    CardView(icon: iconArray[index], name: "World", isSelected: true)
                }
                
                
            }.padding()
            
     
    }
}
struct gameTitle: View {
    let gameName: String
    let gameLogo: String
    var body: some View {
        HStack(alignment: .center) {
            Text(gameLogo).font(.system(size: 40))
            Text(gameName).font(.system(size: 40, weight: .bold))
        }
      
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
        .frame(width: 80, height: 600)
        .onTapGesture {
            
            isSelected.toggle()
        }
    }
}

#Preview {
    ContentView()
}
