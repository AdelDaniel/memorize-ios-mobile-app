//
//  MemorizeGameModel.swift
//  memorize
//
//  Created by Adel Nabil on 07/12/2024.
//

import Foundation


struct MemorizeGameModel<CardContentType> {
    private(set) var cards: [MemorizeGameCardModel]
    
     
    init(numberOfPairs: Int , cardContentFactory: (Int) -> CardContentType ) {
        var cards: [MemorizeGameCardModel] = []
        /// The max number of pairs must be more than 2
        for pairIndex in 0..<max(2,numberOfPairs) {
            let cardContentType = cardContentFactory(pairIndex)
            cards.append(MemorizeGameCardModel(content: cardContentType) )
            cards.append(MemorizeGameCardModel(content: cardContentType) )
            
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
    struct MemorizeGameCardModel {
        var isFaceUp: Bool = true
        var isMatched: Bool  = false
        var content: CardContentType
        
    }
}
