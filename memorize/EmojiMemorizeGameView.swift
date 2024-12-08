//
//  EmojiMemorizeGameView.swift
//  memorize
//
//  Created by Adel Nabil on 18/11/2024.
//

import SwiftUI
import SwiftData

#Preview {
    EmojiMemorizeGameView()
        .modelContainer(for: Item.self, inMemory: true)
}


struct EmojiMemorizeGameView: View {
    let emojis : [String] = ["🐶", "🐟", "👻", "🤯","🙈","👀","👦","👧","💍","💎","👰" , "👲", "👵", "👸", "👹", "👺","😎",]
    
    let initCountNumber: Int  = 4
    @State var countNumber: Int = 4
    
    var body: some View {
        VStack {
            title
            cards
            Spacer()
            cardsAdjuster
        }.padding()
    }
    
    var title: some View{
        Text("Memorize")
            .font(.title)
            .padding()
    }
    
    var cards: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))] ){
                ForEach(0..<countNumber , id: \.self){
                    index in
                    CardView(content: emojis[index] ,isOpen: true)
                        .aspectRatio(2/3 , contentMode: .fit)
                }
            }
        }
    }
    
    var cardsAdjuster: some View {
        HStack (alignment: .center){
            cardAdder
            Spacer()
            reset
            Spacer()
            cardRemover
        }.font(.title2)
        
    }
    
    var cardAdder : some View {
        button(by: +1, title: "Add Card")
    }
    
    var cardRemover: some View {
        button(by: -1, title: "Remove Card")
    }
    
    func button(by offset: Int , title: String) -> some View {
        Button(title )  {
            countNumber += offset
        }.disabled(countNumber + offset > emojis.count || countNumber + offset < 0)
        
    }
    
    var reset : some View {
        Button(action: {
            countNumber = initCountNumber
        } ,label:{
            Image(systemName: "clear")
        })
    }
}


struct CardView : View {
    let content: String
    @State var isOpen: Bool = false;
    
    var body: some View {
        let roundRectangle = RoundedRectangle(cornerRadius: 20)
        //        let base = Circle()
        ZStack {
            Group {
                
                roundRectangle.fill(Color.white)
                roundRectangle.stroke(Color.red , lineWidth: 2)
                Text(content)
                
            }.opacity(isOpen ? 1 : 0)
            roundRectangle.fill(Color.red).opacity(isOpen ? 0 : 1)
        }    .onTapGesture(count: 1, perform:  {
            print("tapped")
            isOpen = !isOpen
        })
    }
}