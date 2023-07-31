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
    @Published var step: Step?
    @Published var name = ""
    @Published var partnerName = ""

    init() {
        sessionManager = SessionManager(state: self)
    }
}
