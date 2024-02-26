//
//  StanfordApp.swift
//  Stanford
//
//  Created by Adam2 on 1/17/24.
//

import SwiftUI

@main
struct StanfordApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

