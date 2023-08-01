//
//  Step.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import Foundation

enum Step: Codable {
    case helmet(state: StepState)
    case torso(state: StepState)

    var number: Int {
        switch self {
        case .helmet:
            return 1
        case .torso:
            return 2
        }
    }

    var state: StepState {
        switch self {
        case let .helmet(state: result):
            return result
        case let .torso(state: result):
            return result
        }
    }
    
    mutating func updateState(new state: StepState) {
        switch self {
        case .helmet:
            self = .helmet(state: state)
        case .torso:
            self = .torso(state: state)
        }
    }
}

enum StepState: Codable {
    case active
    case inactive
    case complete
}
