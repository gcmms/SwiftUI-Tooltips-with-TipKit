//
//  TipKitApp.swift
//  TipKit
//
//  Created by Gabriel Sanzone on 22/07/24.
//

import SwiftUI
import TipKit

@main
struct TipKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
