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
            // Make it immserive
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
                
                // Add an ImageBasedLight for the immersive content
                // Two orbs behind the ContentView
                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                immersiveContentEntity.components.set(iblComponent)
                immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))

                // box that defies physics
                let box = ModelEntity(mesh: .generateBox(size: 0.5), materials: [SimpleMaterial(color: .red, isMetallic: false)])
                
                immersiveContentEntity.addChild(box)
                box.transform.translation = [0, 0, -3]
                
                
                // box that obeys physics
                let physicsBox = ModelEntity(mesh: .generateBox(size: 0.3), materials: [SimpleMaterial(color: .red, isMetallic: false)])
                let collisionBox = ShapeResource.generateBox(size: SIMD3(x: 0.3, y: 0.3, z: 0.3))
                
                var physics = PhysicsBodyComponent(shapes: [collisionBox], density: 9_999_999)
                
                // turn gravity on explicitly
                physics.isAffectedByGravity = true
                
                physicsBox.components.set(CollisionComponent(shapes: [collisionBox]))
                
                physicsBox.components.set(physics)
                
                physicsBox.transform.translation = [1, 1, -3]
                
                immersiveContentEntity.addChild(physicsBox)
                
                // https://developer.apple.com/documentation/uikit/uicollisionbehavior/1624828-collisiondelegate?changes=_2_8
                
                let respawnPlane = ModelEntity(mesh: .generatePlane(width: 10, depth: 10))
                respawnPlane.transform.translation = [0, -34, 0]
                
                immersiveContentEntity.addChild(respawnPlane)
                
                           
            }
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
