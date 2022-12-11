//
//  mini_challenge_2App.swift
//  mini-challenge-2
//
//  Created by Clarence on 16/06/22.
//

import SwiftUI

@main
struct mini_challenge_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            DetailReviewView(id: 1)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            // ReviewView()
            AuthView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(AuthState())
//            RegisterView()
        }
    }
}
