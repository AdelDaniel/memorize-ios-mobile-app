//
//  CardView.swift
//  memorize
//
//  Created by Adel Nabil on 20/12/2024.
//

import SwiftUI


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
            CardView(cardModel: MemorizeGameModel<String>.MemorizeGameCardModel(
                isFaceUp: true,
                content: "this text is too long to fit",
                id: "ID")
            )
            CardView(cardModel: MemorizeGameModel<String>.MemorizeGameCardModel(content: "C", id: "ID")
            )
        }
        
        HStack{
            CardView(cardModel: MemorizeGameModel<String>.MemorizeGameCardModel(content: "C", id: "ID")
            )
            CardView(
                cardModel: MemorizeGameModel<String>.MemorizeGameCardModel(
                    isMatched : true,
                    content: "C", id: "ID")
            )
        }
        
    }
    
}
