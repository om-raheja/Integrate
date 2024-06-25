//
//  ImmersiveView.swift
//  Integrate!
//
//  Created by Om Raheja on 6/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                // Add an ImageBasedLight for the immersive content
                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                immersiveContentEntity.components.set(iblComponent)
                immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
                let box = ModelEntity(mesh: .generateBox(size: 0.5), materials: [SimpleMaterial(color: .red, isMetallic: false)])
                
                immersiveContentEntity.addChild(box)
                box.transform.translation = [0, 0, -3]
                
                
                let physicsBox = ModelEntity(mesh: .generateBox(size: SIMD3<Float>(1, 1, 1)))
                physicsBox.components.set(PhysicsBodyComponent(shapes: [.generateBox(size: SIMD3<Float>(1, 1, 1))], mass: 3))

                
                physicsBox.transform.translation = [1, 2, -3]
                
                immersiveContentEntity.addChild(physicsBox)
                
                           
            }
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
