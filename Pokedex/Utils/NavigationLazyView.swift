//
//  NavigationLazyView.swift
//  Pokedex
//
//  Created by Елизавета on 5/28/21.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
