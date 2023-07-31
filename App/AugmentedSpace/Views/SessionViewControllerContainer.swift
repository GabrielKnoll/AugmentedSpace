//
//  SessionViewControllerContainer.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct SessionViewControllerContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = SessionViewController

    @EnvironmentObject var state: State

    func makeUIViewController(context: Context) -> SessionViewController {
        return SessionViewController(sessionManager: state.sessionManager)
    }

    func updateUIViewController(_ uiViewController: SessionViewController, context: Context) {}
}
