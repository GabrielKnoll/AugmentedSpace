//
//  BodyTrackedARViewContainer.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct BodyTrackedARViewContainer: UIViewRepresentable {
    @EnvironmentObject var state: AppState

    func makeUIView(context: Context) -> ARView { BodyTrackedARView(state: state) }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
