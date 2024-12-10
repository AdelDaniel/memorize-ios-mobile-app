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
            cards.append(MemorizeGameCardModel(id: "\(pairIndex+1)A", content: cardContentType) )
            cards.append(MemorizeGameCardModel(id: "\(pairIndex+1)B", content: cardContentType) )
            
        }
        self.cards = cards
    }
    
    // MARK: - Functions
    
    // mutating means: copy and write here because it is immutable
    mutating func shuffleCards() {
        self.cards.shuffle()
        print(cards)
    }
    
    func chooseCard(_ card: MemorizeGameCardModel) {
        
    }
    
    
    
    // MARK: - Struct
    struct MemorizeGameCardModel: Equatable, Identifiable{
        var id: String
        
        
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
        
        
    }
}
