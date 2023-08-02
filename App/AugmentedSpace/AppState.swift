//
//  AppState.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import Foundation

class AppState: ObservableObject {
    private(set) var sessionManager: SessionManager?
    var debug = false
    @Published var role: Role = .checklist
    @Published private(set) var currentStep: Step?
    @Published private(set) var steps = [Step]()
    @Published private(set) var currentStepLimit = 0
    @Published var enablePhoto = false
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
        currentStep = steps.first
    }

    private func setCurrentStep(step: Step) {
        currentStep = step
        currentStep!.updateState(new: .active)
        steps[step.number - 1] = currentStep!
        currentStepLimit = step.number - 1
    }

    func finishCurrentStep() {
        guard var currStep = currentStep else { return }
        let index = currStep.number - 1
        currStep.updateState(new: .complete)
        steps[index] = currStep
        let newIndex = index + 1
        if newIndex < steps.count {
            setCurrentStep(step: steps[newIndex])
            if case .photo = currentStep! {
                enablePhoto = true
            }
        } else {
            currentStep = nil
        }
    }

    func receivedStepUpdate(step: Step) {
        steps[step.number - 1] = step
        if step.state == .active {
            setCurrentStep(step: step)
        }
    }
}
