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
    
    var onlyOneCardFaceUpIndex: Int? {
        get{
            return cards.indices.filter{  cards[$0].isFaceUp }.onlyFirst
        }
        set{
            cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)   }
        }
    }
    
    
    // MARK: - Functions
    
    // mutating means: copy and write here because it is immutable
    mutating func shuffleCards() {
        self.cards.shuffle()
        print(cards)
    }
    
    // mutating means: copy and write here because it is immutable
    mutating func resetCards() {
        onlyOneCardFaceUpIndex = nil
        self.cards.indices.forEach {
            cards[$0].isFaceUp = false
            cards[$0].isMatched = false
        }
        self.cards.shuffle()
        print(cards)
    }
    
    
    mutating func chooseCard(_ card: MemorizeGameCardModel) {
        if let choseCardIndex = index(of: card) {
            if !cards[choseCardIndex].isFaceUp && !cards[choseCardIndex].isMatched {
                if let potentialIndex = onlyOneCardFaceUpIndex {
                    
                    // check the last selected card index and current selected card index are matched
                    if cards[choseCardIndex].content == cards[potentialIndex].content {
                        cards[choseCardIndex].isMatched = true
                        cards[potentialIndex].isMatched = true
                    }
                }
                else{
                    onlyOneCardFaceUpIndex = choseCardIndex
                }
                
                cards[choseCardIndex].isFaceUp = true
            }
        }
    }
    
    
    private func index(of card: MemorizeGameCardModel)-> Optional<Int>{
        if let index = cards.firstIndex (where: { $0.id == card.id }){
            return .some(index)
        }
        return .none
        
        
        
        //        for index in cards.indices  {
        //            if cards[index].id == card.id {
        //                return .some(index)
        //            }
        //        }
        //        return .none
    }
    
    
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
        
        var isFaceUp: Bool = false
        var isMatched: Bool  = false
        var content: CardContentType
        
        var id: String
        
        // MARK:  Methods
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "Face UP" : "Face Down") & \(isMatched ? "Matched" : "Not Matched")"
        }
        
        
        
        
        
    }
}

extension Array {
    var onlyFirst: Element? {
        count == 1 ? first : nil
    }
}
