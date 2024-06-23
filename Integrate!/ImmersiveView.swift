import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            for entity in content.entities {
                content.remove(entity)
            }
            
            let sphere = ModelEntity(mesh: .generateSphere(radius: 0.5), materials: [SimpleMaterial(color: .white, isMetallic: false)])
            content.add(sphere)

            // Add interaction or additional content here
        }
    }
}

#Preview() {
    ImmersiveView()
}
