//
//  transportttApp.swift
//  transporttt
//
//  Created by haffa dhifi on 4/11/2023.
//

import SwiftUI
import Firebase

@main
struct transportttApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            StationView()
                .environmentObject(locationViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
