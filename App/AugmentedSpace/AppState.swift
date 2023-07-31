//
//  AppState.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import Foundation

class AppState: ObservableObject {
    var sessionManager = SessionManager()
    var role: Role? = .fitting
    @Published var step: Step?
    @Published var name = ""
    @Published var mcText = "No text so far" {
        didSet {
            print("wow, new text: \(mcText)")
        }
    }
}
