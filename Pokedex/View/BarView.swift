//
//  BarView.swift
//  Pokedex
//
//  Created by Елизавета on 5/28/21.
//

import SwiftUI

struct BarView: View {
    var value: Int = 100
    var title: String = "HP"
    var color: Color = .blue
    var maxSize: Int = 100
    
    init(value: Int, title: String, color: Color) {
        self.value = value
        self.title = title
        self.color = color
        
        switch title {
        case "Height": maxSize = 25
        case "Attack": maxSize = 134
        case "Defense": maxSize = 180
        case "Weight": maxSize = 1550
        default: maxSize = 100
        }
    }
        
    var body: some View {
            
        HStack {
            Text(title)
                .padding(.leading, 32)
                .foregroundColor(.gray)
                .frame(width: 100)
            
            HStack {
                Text("\(value)")
                    .frame(width: 50)
                    .padding(.trailing)
                    .foregroundColor(.black)
                                    
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 180, height: 20).animation(.default)
                        .foregroundColor(Color(.systemGray5))
                    
                    Capsule()
                        .frame(width: CGFloat(180 * value / maxSize) > 180 ? 180 : CGFloat(180 * value / maxSize) < 15 ? 15 : CGFloat(180 * value / maxSize), height: 20).animation(.default)
                        .foregroundColor(color)
                    }
                    Spacer()
                }.padding(.leading)
            }
        }
    }

    struct BarChartView: View {
        let pokemon: Pokemon
        var body: some View {
            VStack {
                BarView(value: pokemon.height, title: "Height", color: .orange)
                BarView(value: pokemon.attack, title: "Attack", color: .red)
                BarView(value: pokemon.defense, title: "Defense", color: .blue)
                BarView(value: pokemon.weight, title: "Weight", color: .purple)
            }.padding()
        }
    }

