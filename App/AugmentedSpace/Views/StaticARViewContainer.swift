//
//  StaticARView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct StaticARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero)

        // swiftlint:disable:next force_try
        let modelEntity = try! ModelEntity.load(named: "astronaut")
        modelEntity.scale = [0.01, 0.01, 0.01]

        let anchorEntity = AnchorEntity()
        anchorEntity.addChild(modelEntity)

        arView.scene.addAnchor(anchorEntity)

        return arView

    }

    func updateUIView(_ uiView: ARView, context: Context) {}

}
