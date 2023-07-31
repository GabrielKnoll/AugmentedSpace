//
//  State.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import Foundation

class State: ObservableObject {
    var sessionManager = SessionManager()
    var role: Role?
    @Published var step: Step?
    @Published var mcText = "No text so far" {
        didSet {
            print("wow, new text: \(mcText)")
        }
    }
}
