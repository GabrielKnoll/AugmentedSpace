//
//  AppState.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import Foundation

class AppState: ObservableObject {
    private(set) var sessionManager: SessionManager?
    var role: Role = .checklist
    @Published private(set) var step: Step?
    @Published var name = ""
    @Published var partnerName = ""

    init() {
        sessionManager = SessionManager(state: self)
    }

    func updateStep(new step: Step) {
        self.step = step
        sessionManager?.sendStep(step: step)
    }

    func receivedStepUpdate(new step: Step) {
        self.step = step
    }
}
