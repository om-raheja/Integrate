//
//  ImmersiveView.swift
//  Integrate!
//
//  Created by Om Raheja on 6/25/24.
//

import Combine
import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var cancellables: Set<AnyCancellable> = []
    var body: some View {
        RealityView { content in
            // Make it immserive
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                //content.add(immersiveContentEntity)
                
                let entity = try? Entity.load(named:  "Box")
                content.add(entity.unsafelyUnwrapped)
                
                // Add an ImageBasedLight for the immersive content
                // Two orbs behind the ContentView
                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                immersiveContentEntity.components.set(iblComponent)
                immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))

                // box that defies physics
                let box = ModelEntity(mesh: .generateBox(size: 0.5), materials: [SimpleMaterial(color: .red, isMetallic: false)])
                
                immersiveContentEntity.addChild(box)
                box.transform.translation = [0, 3, -2]
                
                
                // box that obeys physics
                let physicsBox = ModelEntity(mesh: .generateBox(size: 0.3), materials: [SimpleMaterial(color: .red, isMetallic: false)])
                let collisionBox = ShapeResource.generateBox(size: SIMD3(x: 0.3, y: 0.3, z: 0.3))
                
                var physics = PhysicsBodyComponent(massProperties: .default, material: nil, mode: .dynamic)
                
                // setup physics box
                physics.isAffectedByGravity = true
                physicsBox.components.set(CollisionComponent(shapes: [collisionBox]))
                physicsBox.components.set(physics)
                physicsBox.transform.translation = [1, 3, -3]
                
                immersiveContentEntity.addChild(physicsBox)
                
                // setup the respawnPlane
                
                // https://developer.apple.com/documentation/uikit/uicollisionbehavior/1624828-collisiondelegate?changes=_2_8
                
                let respawnPlane = ModelEntity(mesh: .generatePlane(width: 100, depth: 100))
                respawnPlane.transform.translation = [0, -34, 0]
                
                // Add collision component to the plane
                let collisionPlaneBox = ShapeResource.generateBox(size: SIMD3(x: 100, y: 0.1, z: 100))
                respawnPlane.components.set(CollisionComponent(shapes: [collisionPlaneBox]))

                
                immersiveContentEntity.addChild(respawnPlane)
                
                immersiveContentEntity.scene?.subscribe(to:
                                                            CollisionEvents.Began.self, on: physicsBox, {  event in
                    
                    print("Collision began between \(event.entityA.name) and \(event.entityB.name)")
                    physicsBox.transform.translation = [1, 3, -3]
                })
            }
        }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
