//
//  EmojiMemorizeGameViewModel.swift
//  memorize
//
//  Created by Adel Nabil on 07/12/2024.
//

import SwiftUI



class EmojiMemorizeGameViewModel {
    
    /// Statics
    private static let emojis = ["🐶", "🐟", "👻", "🤯","🙈","👀","👦","👧","💍","💎","👰" , "👲", "👵", "👸", "👹", "👺","😎"]
    
    private static func createMemorizeGameModel() -> MemorizeGameModel<String>{
        /// We check that pair index in the scope length of the emojis list
        MemorizeGameModel(numberOfPairs: 4){pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "☹️"
            }
            
        }
    }
    
    /// Variables
    private var model = createMemorizeGameModel()
    
    
    /// Functions
    var cards: [MemorizeGameModel<String>.MemorizeGameCardModel] {
        return model.cards
    }
    
    func chooseCard(_ card: MemorizeGameModel<String>.MemorizeGameCardModel){
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
    
    
    /// Normal Two --> Change The Curly Practise and add in
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
