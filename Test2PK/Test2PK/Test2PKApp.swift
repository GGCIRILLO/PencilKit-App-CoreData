//
//  Test2PKApp.swift
//  Test2PK
//
//  Created by Luigi Cirillo on 11/12/23.
//

import SwiftUI

@main
struct Test2PKApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
