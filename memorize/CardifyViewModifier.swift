//
//  CardifyViewModifier.swift
//  memorize
//
//  Created by Adel Nabil on 21/12/2024.
//

import SwiftUI

struct CardifyViewModifier : ViewModifier {
    let isFaceUp : Bool
    
    func body(content: Content) -> some View {
        let roundRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        
        ZStack {
            Group {
                roundRectangle.fill(Color.white)
                roundRectangle.stroke(Color.red , lineWidth: Constants.lineWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            roundRectangle.fill(Color.red).opacity(isFaceUp ? 0 : 1)
        }
        
    }
    
    private struct Constants{
        static let cornerRadius: CGFloat = 16
        static let lineWidth : CGFloat = 2
    }
}
