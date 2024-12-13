//
//  EmojiMemorizeGameView.swift
//  memorize
//
//  Created by Adel Nabil on 18/11/2024.
//

import SwiftUI
import SwiftData

#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGameViewModel())
        .modelContainer(for: Item.self, inMemory: true)
}


struct EmojiMemorizeGameView: View {
    
    // ObservedObject always have to be passed to you
    @ObservedObject var viewModel: EmojiMemorizeGameViewModel
        
    var body: some View {
        VStack {
            title
            cards.animation(.default, value: viewModel.cards)
            Spacer()
            cardsAdjuster
        }.padding()
    }
    
    var title: some View{
        Text("Memorize")
            .font(.title)
            .padding()
    }
    
    var cards: some View{
        ScrollView{
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 80), spacing: 0)] ,
                spacing: 0 )
            {
                /// Card Index
                //                ForEach(viewModel.cards.indices , id: \.self){
                //                    index in
                //                    CardView(cardModel: viewModel.cards[index])
                //                        .aspectRatio(2/3 , contentMode: .fit)
                //                        .padding(4)
                //                }
                
                /// Card itself
                ForEach(viewModel.cards){
                    card in
                    CardView(cardModel: card)
                        .aspectRatio(2/3 , contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.chooseCard(card)
                        }
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
            viewModel.shuffleCards()
        } ,label:{
            Image(systemName: "shuffle")
        })
    }
    
}


struct CardView : View {
    
    var cardModel: MemorizeGameModel<String>.MemorizeGameCardModel
    
    var body: some View {
        let roundRectangle = RoundedRectangle(cornerRadius: 16)
        //        let base = Circle()
        ZStack {
            Group {
                roundRectangle.fill(Color.white)
                roundRectangle.stroke(Color.red , lineWidth: 2)
                Text(cardModel.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            }.opacity(cardModel.isFaceUp ? 1 : 0)
            roundRectangle.fill(Color.red).opacity(cardModel.isFaceUp ? 0 : 1)
        }.opacity(cardModel.isMatched ? 0 : 1)
    }
}
