//
//  BodyTrackedARView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import ARKit
import Combine
import RealityKit
import UIKit

class BodyTrackedARView: ARView, ARSessionDelegate {
    var state: AppState
    var character: BodyTrackedEntity?
    let characterOffset: SIMD3<Float> = [0, 0, 0] // Offset the character by one meter to the left
    let characterAnchor = AnchorEntity()

    init(state: AppState) {
        self.state = state
        super.init(frame: .zero)

        state.selectedItemToDisplay = { item in
            self.loadModel(for: item)
        }

        state.machFoto = { completion in
            self.takeSnapshot(completion: completion)
        }

        configureARView()
    }

    func configureARView() {
        session.delegate = self

        // If the iOS device doesn't support body tracking, raise a developer error for
        // this unhandled case.
        guard ARBodyTrackingConfiguration.isSupported else {
            fatalError("This feature is only supported on devices with an A12 chip")
        }

        // Run a body tracking configration.
        let configuration = ARBodyTrackingConfiguration()
        session.run(configuration)

        scene.addAnchor(characterAnchor)
    }
    
    func loadModel(for item: Item) {
        var cancellable: AnyCancellable?
        cancellable = Entity.loadBodyTrackedAsync(named: item.model).sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error: Unable to load model: \(error.localizedDescription)")
                }
                cancellable?.cancel()
            }, receiveValue: { (character: Entity) in
                if let character = character as? BodyTrackedEntity {
                    // Scale the character to human size
                    character.scale = [0.01, 0.01, 0.01]  // Scale the character to human size [0.1, 0.1, 0.1]
                    self.character = character
                    cancellable?.cancel()
                } else {
                    print("Error: Unable to load model as BodyTrackedEntity")
                }
            })
    }

    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }

            // Update the position of the character anchor's position.
            let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
            characterAnchor.position = bodyPosition + characterOffset
            // Also copy over the rotation of the body anchor, because the skeleton's pose
            // in the world is relative to the body anchor's rotation.
            characterAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation

            if let character = character, character.parent == nil {
                // Attach the character to its anchor as soon as
                // 1. the body anchor was detected and
                // 2. the character was loaded.
                characterAnchor.addChild(character)
            }
        }
    }

    func takeSnapshot(completion: @escaping (Image) -> Void) {
        snapshot(saveToHDR: false) { image in
            guard let image = image else {
                assertionFailure("Nix Foto")
                return
            }
            completion(image)
        }
    }

    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @MainActor required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
}
