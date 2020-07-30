//
//  ColorCollectionApp.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/05.
//

import SwiftUI

@main
struct ColorCollectionApp: App {
    let persistence = PersistenceManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.persistentContainer.viewContext)
        }
    }
}
