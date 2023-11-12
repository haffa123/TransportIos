//
//  transportttApp.swift
//  transporttt
//
//  Created by haffa dhifi on 4/11/2023.
//

import SwiftUI

@main
struct transportttApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
