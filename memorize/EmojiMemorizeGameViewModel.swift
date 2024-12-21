//
//  EmojiMemorizeGameViewModel.swift
//  memorize
//
//  Created by Adel Nabil on 07/12/2024.
//

import SwiftUI



/// ObservableObject: is a protocol to update the view when change the variables marked as @Published
/// Also need to mark this viewModel at deceleration as @ObservedObject
class EmojiMemorizeGameViewModel : ObservableObject {
    
    typealias CardModel = MemorizeGameModel<String>.MemorizeGameCardModel;
    
    //MARK: Statics
    private static let emojis = ["🐶", "🐟", "👻", "🤯","🙈","👀","👦","👧","💍","💎","👰" , "👲", "👵", "👸", "👹", "👺","😎"]
    
    static let numberOfPairs: Int = 8
    static let numberOfCards: Int = numberOfPairs * 2
    
    private static func createMemorizeGameModel() -> MemorizeGameModel<String>{
        /// We check that pair index in the scope length of the emojis list
        MemorizeGameModel(numberOfPairs: numberOfPairs){pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "☹️"
            }
            
        }
    }
    
    // MARK: Variables
    
    
    // published means that when this change it will affect the UI
    @Published private var model = createMemorizeGameModel()
    
    
    // MARK: Functions
    var cards: [CardModel] {
        return model.cards
    }
    
    
    // MARK: - Intents
    
    func shuffleCards(){
        model.shuffleCards()
    }
    
    func resetCards(){
        model.resetCards()
    }
    
    func chooseCard(_ card: CardModel){
        print("Choose Card: \(card)")
        model.chooseCard(card)
    }
    
    
    
    
    /// Trailing Clauser Syntax
    //    private var model = MemorizeGameModel(numberOfPairs: 4){ index in
    //        return emojis[index]
    //    }
    
    
    
    /// Normal Three --> Remove "String" and "Int" from the Normal 2: The method is already know that it return string and takes Int index
    //    private var model = MemorizeGameModel(
    //        numberOfPairs: 4,
    //        cardContentFactory: { index in
    //            return emojis[index]
    //        }
    //    )
    
    
    /// Normal Two --> Change The Curly brackets and add in
    //    private var model = MemorizeGameModel<String>(
    //        numberOfPairs: 4,
    //        cardContentFactory: { (index: Int) -> String in
    //            return emojis[index]
    //        }
    //    )
    
    /// Normal One
    //    private var model: MemorizeGameModel<String> = MemorizeGameModel<String>(
    //        numberOfPairs: 4,
    //        cardContentFactory: createEmojiContentType
    //    )
    //    static func createEmojiContentType (forPairAtIndex index: Int) -> String {
    //        return  emojis[index]
    //    }
    
}
