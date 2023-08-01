//
//  Step.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

enum Step: Codable {
    case coolingGarment(state: StepState)
    case lowerTorso(state: StepState)
    case hardUpperTorso(state: StepState)
    case lifeSupportSystem(state: StepState)
    case gloves(state: StepState)
    case helmet(state: StepState)

    var number: Int {
        switch self {
        case .coolingGarment:
            return 1
        case .lowerTorso:
            return 2
        case .hardUpperTorso:
            return 3
        case .lifeSupportSystem:
            return 4
        case .gloves:
            return 5
        case .helmet:
            return 6
        }
    }

    var state: StepState {
        switch self {
        case let .helmet(state: result):
            return result
        case let .gloves(state: result):
            return result
        case let .coolingGarment(state: result):
            return result
        case let .lowerTorso(state: result):
            return result
        case let .hardUpperTorso(state: result):
            return result
        case let .lifeSupportSystem(state: result):
            return result
        }
    }

    var componentTitleCL: String {
        switch self {
        case .coolingGarment:
            return ("CG")
        case .lowerTorso:
            return ("LT")
        case .hardUpperTorso:
            return ("HUT")
        case .lifeSupportSystem:
            return ("LSS")
        case .gloves:
            return ("GL")
        case .helmet:
            return ("HT")
        }
    }

    var componentTextCL: String {
        switch self {
        case .coolingGarment:
            return ("The first piece of a spacesuit is made of stretchy spandex and water tubes, covers the entire body except for the head, hands, and feet. It effectively regulates body temperature, removes excess heat, and promotes circulation during spacewalks.")
        case .lowerTorso:
            return ("This section of the suit is made up of spacesuit pants, boots and the lower half of the waist closure. A metal body-seal closure connects this part of the suit to the hard upper torso. A part of it called the waist bearing helps the astronaut move and turn.")
        case .hardUpperTorso:
            return ("The next piece we are looking for is lightweight but strong and connects the inside of the suit with the appropriate systems in the portable life support system. It is shaped like a sleeveless shirt and connects to the arm assembly that covers the arms and joins the gloves.")
        case .lifeSupportSystem:
            return ("The next component houses the supplies and equipment to make the suit work. It contains the oxygen that astronauts breathe and that pressurizes the suit. It also provides electricity for the suit and holds a two-way radio for communication.")
        case .gloves:
            return ("The next component protects a part of the body that gets coldest in space. It is equipped with heaters and should also allow dexterity for the use of tools.")
        case .helmet:
            return ("The last piece we are looking for serves as a pressure bubble and is made of strong plastic to keep the pressure of the suit contained. It also has a ventilation system that provides astronauts with oxygen. Outside of this bubble is a protective visor that keeps the pressure bubble from getting bumped or scratched.")
        }
    }

    mutating func updateState(new state: StepState) {
        switch self {
        case .helmet:
            self = .helmet(state: state)
        case .coolingGarment:
            self = .coolingGarment(state: state)
        case .lowerTorso:
            self = .lowerTorso(state: state)
        case .hardUpperTorso:
            self = .hardUpperTorso(state: state)
        case .lifeSupportSystem:
            self = .lifeSupportSystem(state: state)
        case .gloves:
            self = .gloves(state: state)
        }
    }
}

enum StepState: Codable {
    case active
    case inactive
    case complete
}
