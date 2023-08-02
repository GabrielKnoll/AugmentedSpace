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
    @Published private(set) var currentStep: Step?
    @Published private(set) var steps = [Step]()
    @Published var name = ""
    @Published var partnerName = ""

    init() {
        sessionManager = SessionManager(state: self)
        setSteps()
    }

    private func setSteps() {
        steps = [
            .coolingGarment(state: .active),
            .lowerTorso(state: .inactive),
            .hardUpperTorso(state: .inactive),
            .gloves(state: .inactive),
            .helmet(state: .inactive),
            .photo(state: .inactive)
        ]
    }

    func finishCurrentStep() {
        guard var currStep = currentStep else { return }
        let index = currStep.number - 1
        currStep.updateState(new: .complete)
        steps[index] = currStep
        if index + 1 < steps.count {
            currentStep = steps[index + 1]
            currentStep?.updateState(new: .active)
        } else {
            currentStep = nil
        }
    }

    func receivedStepUpdate(step: Step) {
        self.currentStep = step
    }
}
