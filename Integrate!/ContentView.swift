//
//  ContentView.swift
//  Integrate!
//
//  Created by Om Raheja on 6/10/24.
//

import SwiftUI
import SwiftData
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @Environment(\.modelContext) var modelContext
    
    @State private var immersify: Bool = false;
    
    @AppStorage("firstRun") private var firstRun = true

    var body: some View {

            VStack {
                Text("Let's get started.")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                HStack {
                    VStack {
                        Button("Level 1") {
                            Task {
                                
                                let result = await openImmersiveSpace(id: "level1")
                                if case .error = result {
                                    print("there was an error")
                                }
                            }
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Button1")
                        })
                        
                    }
                    
                    VStack {
                        Button(action: {}, label: {
                            Text("Button1")
                        })
                        Button(action: {}, label: {
                            Text("Button1")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Button1")
                        })
                        
                    }
                    
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Button1")
                        })
                        Button(action: {}, label: {
                            Text("Button1")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Button1")
                        })
                        
                    }
                }

        }
    }
}


#Preview(windowStyle: .automatic) {
    ContentView()
}
