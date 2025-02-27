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
        PieShape()
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(cardModel.content)
                    .font(.system(size: Constants.Font.size))
                    .minimumScaleFactor(Constants.Font.minimumScaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Font.padding)
            )
            .padding(Constants.insets)
            .cardifyViewModifier(isFaceUp: cardModel.isFaceUp)
            .opacity(cardModel.isMatched ? 0 : 1)
    }
    
    private struct Constants{
        static let insets: CGFloat = 5

        struct Font{
            static let size: CGFloat = 200
            static let padding: CGFloat = 5
            static let aspectRatio: CGFloat = 1
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let minimumScaleFactor: CGFloat = smallest/largest
        }
        
        struct Pie{
            static let opacity: CGFloat = 0.5
        }
        
        
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
