//
//  Integrate_App.swift
//  Integrate!
//
//  Created by Om Raheja on 6/10/24.
//

import SwiftUI

@main
struct Integrate_App: App {
    var body: some Scene {
        WindowGroup("Hello World", id: "modules") {
            ContentView()
        }

        ImmersiveSpace(id: "level1") {
            ImmersiveView()
        }
    }
}
