//
//  MemorizeGameModel.swift
//  memorize
//
//  Created by Adel Nabil on 07/12/2024.
//

import Foundation


struct MemorizeGameModel<CardContentType> where CardContentType: Equatable {
    private(set) var cards: [MemorizeGameCardModel]
    
    
    init(numberOfPairs: Int , cardContentFactory: (Int) -> CardContentType ) {
        var cards: [MemorizeGameCardModel] = []
        /// The max number of pairs must be more than 2
        for pairIndex in 0..<max(2,numberOfPairs) {
            let cardContentType = cardContentFactory(pairIndex)
            cards.append(MemorizeGameCardModel(
                content: cardContentType, id: "\(pairIndex+1)A")
            )
            cards.append(MemorizeGameCardModel(
                content: cardContentType, id: "\(pairIndex+1)B")
            )
        }
        self.cards = cards
    }
    
    // MARK: - Functions
    
    // mutating means: copy and write here because it is immutable
    mutating func shuffleCards() {
        self.cards.shuffle()
        print(cards)
    }
    
    mutating func chooseCard(_ card: MemorizeGameCardModel) {
        if let choseCardIndex = index(of: card) {
            cards[choseCardIndex].isFaceUp.toggle()
        }
    }
    
    
    private func index(of card: MemorizeGameCardModel)-> Optional<Int>{
        for index in cards.indices  {
            if cards[index].id == card.id {
                return .some(index)
            }
        }
        return .none      }
    
    
    // MARK: - Struct
    struct MemorizeGameCardModel: Equatable, Identifiable,
                                  CustomDebugStringConvertible{
        // Equatable Function if required
        //        static func == (
        //            lhs: MemorizeGameModel<CardContentType>.MemorizeGameCardModel,
        //            rhs: MemorizeGameModel<CardContentType>.MemorizeGameCardModel) -> Bool {
        //                return lhs.isFaceUp != rhs.isFaceUp
        //                && lhs.isMatched == rhs.isMatched
        //                && lhs.content == rhs.content
        //            }
        
        var isFaceUp: Bool = true
        var isMatched: Bool  = false
        var content: CardContentType
        
        var id: String
        
        // MARK:  Methods
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "Face UP" : "Face Down") & \(isMatched ? "Matched" : "Not Matched")"
        }
        
        
        
        
        
    }
}
