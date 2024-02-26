//
//  ContentView.swift
//  Stanford
//
//  Created by Adam2 on 1/17/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    //what should a good name for this var be?
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            HStack {
                Button(action: {
                }) {
                    VStack {
                        Image(systemName: "party.popper.fill")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity)
                        
                        Text("Button 1")
                            .padding(.bottom, 4)
                    }
                }
                Button(action: {
                }) {
                    VStack {
                        Image(systemName: "circle.grid.hex.fill")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity)
                        
                        Text("Button 2")
                            .padding(.bottom, 4)
                    }
                }
                Button(action: {
                }) {
                    VStack {
                        Image(systemName: "a.book.closed.fill.ja")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity)
                        
                        Text("Button 3")
                            .padding(.bottom, 4)
                    }
                }
                Button("Shuffle") {
                    viewModel.shuffle()
                }
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.teal)
    }
    
}

struct CardView: View {

    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
