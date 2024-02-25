//
//  ProductEntityView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import SwiftUI
import RealityKit

#if os(visionOS)
struct ProductEntityView: View {
    @State private var isDragging: Bool = false
    @State private var rotation: Angle = .zero
    
    var entityName: String
    var body: some View {
        RealityView { content in
            if let entity = try? await ModelEntity(named: entityName) {
                entity.generateCollisionShapes(recursive: false)
                entity.components.set(InputTargetComponent())
                content.add(entity)
            }
        }
        .gesture(DragGesture()
            .onChanged { _ in
                isDragging = true
                rotation.degrees += 5.0
            }
            .onEnded { _ in
                isDragging = false
            })
        .rotation3DEffect(rotation, axis: .y)
    }
}

#Preview {
    ProductEntityView(entityName: "air_force")
}

#endif
