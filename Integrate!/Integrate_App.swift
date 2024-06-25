//
//  Integrate_App.swift
//  Integrate!
//
//  Created by Om Raheja on 6/25/24.
//

import SwiftUI

@main
struct Integrate_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
