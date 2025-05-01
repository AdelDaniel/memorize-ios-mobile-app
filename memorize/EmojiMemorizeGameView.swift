//
//  EmojiMemorizeGameView.swift
//  memorize
//
//  Created by Adel Nabil on 18/11/2024.
//

import SwiftUI
import SwiftData


struct EmojiMemorizeGameView: View {
    
    
    typealias CardModel = MemorizeGameModel<String>.MemorizeGameCardModel;
    
    let aspectRatio: CGFloat = 2/3
    
    // ObservedObject always have to be passed to you
    @ObservedObject var viewModel: EmojiMemorizeGameViewModel
    
    var body: some View {
        VStack {
            HStack{
                title
                Spacer()
                scoreView
            }.padding()
            cards
            /// the next one is implicit animation - depends on value changes
            //  .animation(.default, value: viewModel.cards)
            Spacer()
            cardsAdjuster
        }.padding()
    }
    
    var scoreView: some View{
        /// nil at the Animation is to stop the animation on this
        Text("Score: \(viewModel.score)")
            .font(.title)
            .animation(nil)
    }
    
    var title: some View{
        Text("Memorize").font(.title)
    }
    
    
    var cards: some View{
        
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio)
        {
            cardItem in
            CardView(cardModel: cardItem)
                .padding(4)
                .overlay(FlyingNumberView(number: changeScore(cardItem: cardItem)))
                .onTapGesture {
                    /// Explicit Animation
                    withAnimation(.linear(duration: 1)) {
                        viewModel.chooseCard(cardItem)
                    }
                }
        }
        
    }
    
    
    var cardsAdjuster: some View {
        HStack (alignment: .center){
            reset
            Spacer()
            shuffleButton
        }.font(.title2)
            .padding(16)
    }
    
    var reset : some View {
        Button(action: {
            viewModel.resetCards()
        } ,label:{
            Image(systemName: "clear")
        })
    }
    
    var shuffleButton : some View {
        Button(action: {
            /// Explicit Animaton
            withAnimation(.easeInOut ) {
                viewModel.shuffleCards()
            }
        } ,label:{
            Image(systemName: "shuffle")
        })
    }
    
    
    // MARK: - methods
    
    private func changeScore( cardItem: CardModel) -> Int {
        return 0
    }
    
}


#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGameViewModel())
        .modelContainer(for: Item.self, inMemory: true)
}
