//
//  CardView.swift
//  memorize
//
//  Created by Adel Nabil on 20/12/2024.
//

import SwiftUI


struct CardView : View {
    typealias CardModel = MemorizeGameModel<String>.MemorizeGameCardModel
    var cardModel: CardModel
    
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
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                
            }.opacity(cardModel.isFaceUp ? 1 : 0)
            roundRectangle.fill(Color.red).opacity(cardModel.isFaceUp ? 0 : 1)
        }.opacity(cardModel.isMatched ? 0 : 1)
    }
}

#Preview {
    
    VStack{
        HStack{
            CardView(cardModel: CardView.CardModel(
                isFaceUp: true,
                content: "this text is too long to fit",
                id: "ID")
            )
            CardView(cardModel: CardView.CardModel(content: "C", id: "ID")
            )
        }
        
        HStack{
            CardView(cardModel: CardView.CardModel(content: "C", id: "ID")
            )
            CardView(
                cardModel: CardView.CardModel(
                    isMatched : true,
                    content: "C", id: "ID")
            )
        }
        
    }
    
}
