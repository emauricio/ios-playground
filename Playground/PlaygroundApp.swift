//
//  playgroundApp.swift
//  playground
//
//  Created by Efren Mauricio on 2021/03/05.
//

import SwiftUI

@main
struct PlaygroundApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
