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
    let emojis : [String] = ["🐶", "🐟", "👻", "🤯"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices , id: \.self){
                index in CardView(content: emojis[index] ,isOpen: true)
            }
//            CardView(content: emojis[0] ,isOpen: true)
//            CardView(content: emojis[1] )
//            CardView(content: emojis[2] )
//            CardView(content: emojis[3] )
        }.padding()
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
