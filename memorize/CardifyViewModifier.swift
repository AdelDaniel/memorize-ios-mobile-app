//
//  CardifyViewModifier.swift
//  memorize
//
//  Created by Adel Nabil on 21/12/2024.
//

import SwiftUI

struct CardifyViewModifier : ViewModifier , Animatable {
    var rotationAngle : Double;
    
    
    init(isFaceUp : Bool = false) {
        self.rotationAngle = isFaceUp ? 180 : 0;
    }
    
    var isFaceUp : Bool {
        rotationAngle >= 90;
    }

    var animatableData: Double{
        get{ rotationAngle }
        set{ rotationAngle = newValue }
    }
    
    func body(content: Content) -> some View {
        let roundRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        
        ZStack {
            Group {
                roundRectangle.fill(Color.white)
                roundRectangle.stroke(Color.red , lineWidth: Constants.lineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            roundRectangle.fill(Color.red)
            .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotationAngle), axis: (0,-1,0))
    }
    
    private struct Constants{
        static let cornerRadius: CGFloat = 16
        static let lineWidth : CGFloat = 2
    }
}


extension View {
    func cardifyViewModifier(isFaceUp: Bool) -> some View {
        modifier(CardifyViewModifier(isFaceUp: isFaceUp))
    }
}
