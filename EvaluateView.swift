//
//  EvaluateView.swift
//  Integrate!
//
//  Created by Om Raheja on 6/16/24.
//

import Foundation
import SwiftUI

struct EvaluateView : View {
    private var levelName = "test"
    init(levelName: String = "test") {
        self.levelName = levelName
    }
    
    var body: some View {
        Button(action: {
            // run the code
        }, label: {
            Text("hi")
        })
    }
}
