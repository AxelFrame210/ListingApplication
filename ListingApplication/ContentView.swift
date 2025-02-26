//
//  ContentView.swift
//  ListingApplication
//
//  Created by Admin on 21/2/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack () {
            Text("Memorize").font(.system(size: 40, weight: .bold))
            HStack() {
                Text("9:30")
                Circle().frame(width: 6, height: 6).foregroundColor(.black)
                Text("Mar,15")
                Circle().frame(width: 6, height: 6).foregroundColor(.black)
            }
            
        }.padding()
        
        VStack{
            HStack{
            
                CardView(icon: "trophy.fill", name: "World", isSelected: false)
                CardView(icon: "star.fill", name: "World", isSelected: false)
                CardView(icon: "suit.heart.fill", name: "World", isSelected: false)
                CardView(icon: "suit.spade.fill", name: "World", isSelected: false)
            }.padding()
            
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
            
            if !isSelected {
               rec.strokeBorder(lineWidth: 1)
                VStack() {
                    Image(systemName: "\(icon)")
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
