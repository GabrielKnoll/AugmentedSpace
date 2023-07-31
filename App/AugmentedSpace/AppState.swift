//
//  AppState.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import Foundation

class AppState: ObservableObject {
    var sessionManager: SessionManager?
    var role: Role = .checklist
    @Published var counter = 0
    @Published var step: Step?
    @Published var name = ""
    @Published var partnerName = ""
    @Published var mcText = "No text so far" {
        didSet {
            print("wow, new text: \(mcText)")
        }
    }

    init() {
        sessionManager = SessionManager(state: self)
    }
}
