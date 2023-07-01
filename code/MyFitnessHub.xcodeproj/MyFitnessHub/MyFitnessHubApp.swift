//
//  MyFitnessHubApp.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//

import SwiftUI

@main
struct MyFitnessHubApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
