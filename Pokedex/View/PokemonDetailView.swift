//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Елизавета on 5/28/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    let viewModel: PokemonCellViewModel
    

    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: self.pokemon)
        print(UserDefaults.standard.bool(forKey: pokemon.name))
        
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(viewModel.backgroundColor), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                            

            
            ScrollView {
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .frame(width: 200, height: 200)
                
                VStack {
                    HStack {
                        Text(pokemon.name.capitalized)
                            .font(.largeTitle)
                            .padding(.top, 40)
                            .foregroundColor(.black)
                        LikeButton(isLikedst: UserDefaults.standard.bool(forKey: pokemon.name), pokemon: pokemon)
                            .padding(.top, 40)
                    }


                    Text(pokemon.type.capitalized)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                        .background(Color(viewModel.backgroundColor))
                        .cornerRadius(20)
                    
                    Text(pokemon.description)
                        .padding(.horizontal, 15)
                        .padding(.top, 12)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack { Spacer() }
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding(.top, -40)
                .zIndex(-1)
                .frame(width: UIScreen.main.bounds.size.width)
                
                HStack {
                    Text("Stats")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.leading)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                }

                
                BarChartView(pokemon: pokemon)
                    .padding(.trailing)
                    .padding(.top, -16)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: SAMPLE_POKEMON)
    }
}

