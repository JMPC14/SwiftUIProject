//
//  ContentView.swift
//  SwiftUI Project
//
//  Created by Jack Colley on 28/09/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1, 2, 0]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var credits = 1000
    private var betAmount = 5
    
    @State private var red: Double = 0
    
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                
                // Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                
                Spacer()
                
                // Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Cards
                HStack {
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[1])

                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[2])

                    Spacer()
                }
                
                Spacer()
                
                // Button
                Button(action: {
                    
                    // Reset backgrounds
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    
                    self.numbers = self.numbers.map { _ in
                        Int.random(in: 0...self.symbols.count - 1)
                    }
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        // Won
                        self.credits += betAmount * 10
                        
                        // Update backgrounds
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.green
                        }
                    } else {
                        // Lost
                        self.credits -= betAmount
                    }
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(CGFloat(red))
                }
                
                Spacer()
                
                SliderView(value: $red, label: "Red")
                    .padding([.leading, .trailing])
            }.padding(.top, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
