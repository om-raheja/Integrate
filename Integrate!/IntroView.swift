//
//  IntroView.swift
//  Integrate!
//
//  Created by Om Raheja on 6/16/24.
//

import Foundation
import SwiftUI


struct IntroView: View {
    let pages = ["hello", "keep scrolling", "done", "hhh", "at", "paeeege 6"] // Add as many page titles as needed
    @State private var currentPageIndex = 0
    
    init(currentPageIndex: Int = 0) {
            self._currentPageIndex = State(initialValue: currentPageIndex)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(pages[currentPageIndex])
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                if currentPageIndex < pages.count - 1 {
                    NavigationLink(destination: IntroView(currentPageIndex: currentPageIndex + 1)) {
                        Text("Next")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                } else {
                    NavigationLink(destination: ContentView()) {
                        Text("Get started")
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Page \(currentPageIndex + 1)")
        }
    }
}
