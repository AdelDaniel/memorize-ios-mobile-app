//
//  ContentView.swift
//  memorize
//
//  Created by Adel Nabil on 18/11/2024.
//

import SwiftUI
import SwiftData

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


struct ContentView: View {
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
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()] ){
            ForEach(0..<countNumber , id: \.self){
                index in CardView(content: emojis[index] ,isOpen: true)
            }}
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
            if isOpen {
                roundRectangle.fill(Color.white)
                roundRectangle.stroke(Color.red , lineWidth: 2)
                Text(content)
                
            } else {
                roundRectangle.fill(Color.red)
                
            }
        }    .onTapGesture(count: 1, perform:  {
            print("tapped")
            isOpen = !isOpen
        })
    }
}

//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var i : Int = 0 ;
//    var body: some View {
//        RoundedRectangle(cornerRadius: 20).fill(Color.red).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//#if os(macOS)
//            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//#endif
//            .toolbar {
//#if os(iOS)
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//#endif
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
