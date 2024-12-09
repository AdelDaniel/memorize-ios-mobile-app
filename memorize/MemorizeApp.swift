//
//  MemorizeApp.swift
//  memorize
//
//  Created by Adel Nabil on 18/11/2024.
//

import SwiftUI
import SwiftData

@main
struct MemorizeApp: App {
    
    @StateObject var emojiMemorizeGameViewModel = EmojiMemorizeGameViewModel()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: emojiMemorizeGameViewModel )
        }
        .modelContainer(sharedModelContainer)
    }
}
