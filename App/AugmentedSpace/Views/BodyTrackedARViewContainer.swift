//
//  BodyTrackedARViewContainer.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct BodyTrackedARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView { BodyTrackedARView() }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
