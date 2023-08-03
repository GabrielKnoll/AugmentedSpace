//
//  BodyTrackedARViewContainer.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct BodyTrackedARViewContainer: UIViewRepresentable {
   // private(set) var arView: BodyTrackedARView = .init()

    func makeUIView(context: Context) -> ARView { BodyTrackedARView() }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
