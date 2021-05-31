//
//  PokemonCellViewModel.swift
//  Pokedex
//
//  Created by Елизавета on 5/28/21.
//

import SwiftUI

struct PokemonCellViewModel {
    let pokemon: Pokemon
        
        var backgroundColor: UIColor {
            switch pokemon.type {
            case "fire": return .systemRed
            case "poison", "bug": return .systemGreen
            case "water": return .systemTeal
            case "electric": return .systemYellow
            case "psychic": return .systemPurple
            case "normal": return .systemOrange
            case "ground": return .systemGray
            case "flying": return .systemBlue
            case "fairy": return .systemPink
            default: return .systemIndigo
            }
        }
        
        init(pokemon: Pokemon) {
            self.pokemon = pokemon
        }
    }
