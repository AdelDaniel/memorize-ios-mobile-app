//
//  AspectVGrid.swift
//  memorize
//
//  Created by Adel Nabil on 14/12/2024.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable , ItemView: View>: View {
    var items: [Item]

    var aspectRatio: CGFloat = 1
    @ViewBuilder var itemView: (Item) -> ItemView
    
    
    init(_ items: [Item], aspectRatio: CGFloat, itemView: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.itemView = itemView
    }
    
    var body: some View {
        GeometryReader{
            geometry in
            
            let fitWidth = cardWidthThatFit(
                numberOfCards: items.count ,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: fitWidth), spacing: 0)] ,
                spacing: 0 )
            {
                ForEach(items){
                    item in
                    itemView(item).aspectRatio(aspectRatio , contentMode: .fit)
                }
                
            }
        }
    }
    
    private func cardWidthThatFit(
        numberOfCards: Int,
        size: CGSize,
        atAspectRatio ratio: CGFloat
    ) -> CGFloat {
        let numberOfCards = CGFloat(numberOfCards)
        var columnCount = 1.0
        repeat {
            let cardWidth = size.width / columnCount
            let cardHeight = cardWidth / ratio
            
            let rowsCount = (numberOfCards / columnCount).rounded(.up)
            
            // the check if the total rows height is less than screen height
            // then that is what we need and return
            if rowsCount * cardHeight < size.height {
                return cardWidth.rounded(.down)
            }
            
            columnCount += 1
            
        }while columnCount < numberOfCards
        
        
        /// if all of the above failed
    
        let cardWidth = size.width / numberOfCards
        let cardHeight = cardWidth / ratio
        
        return min(cardWidth, cardHeight).rounded(.down)

        
    }
}

