//
//  HeavyWeightMigCoreDataApp.swift
//  HeavyWeightMigCoreData
//
//  Created by Orangebits iOS User on 17/11/25.
//

import SwiftUI

@main
struct HeavyWeightMigCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
