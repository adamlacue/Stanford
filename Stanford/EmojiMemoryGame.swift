//
//  EmojiMemoryGame.swift
//  Stanford
//
//  Created by Adam2 on 1/31/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

        
    
        private static var emojis = ["📡", "🔦", "💶", "🕰", "🎚", "🪜", "💎", "⚖️", "🔨", "🔭"]
    
        private static var emoji = ["📡", "🔦", "💶", "🕰", "🎚", "🪜", "💎", "⚖️", "🔨", "🔭"]
        
        private static let sports = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏"]
        
        private static let food = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒"]  
 
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func emojiButton() {
        EmojiMemoryGame.emojis = EmojiMemoryGame.emoji
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func sportsButton() {
        EmojiMemoryGame.emojis = EmojiMemoryGame.sports
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func foodButton() {
        EmojiMemoryGame.emojis = EmojiMemoryGame.food
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}






