//
//  LikeButton.swift
//  Pokedex
//
//  Created by Елизавета on 5/30/21.
//

import SwiftUI


struct LikeButton: View {
    @State var isLikedst: Bool
    let pokemon: Pokemon
    
    var body: some View {
        Button(action: {
            self.isLikedst.toggle()
            UserDefaults.standard.set(self.isLikedst, forKey: pokemon.name)
        }, label: {
            Image(systemName: isLikedst ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .foregroundColor(isLikedst ? .red : .gray)
        })
    }
}
