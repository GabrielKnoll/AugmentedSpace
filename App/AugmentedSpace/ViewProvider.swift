//
//  ViewProvider.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

enum Page {
    case menu
    case collaboration
    case instruction
    case checklist(step: Step)
    case fitting
    case photo
}

enum Step: Codable {
    case coolingGarment(complete: Bool)
    case lowerTorso (complete: Bool)
    case hardUpperTorso (complete: Bool)
    case lifeSupportSystem (complete: Bool)
    case gloves (complete: Bool)
    case helmet(complete: Bool)
    
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
    
    var complete: Bool {
        switch self {
        case let .coolingGarment(complete: result):
            return result
        case let .lowerTorso(complete: result):
            return result
        case let .hardUpperTorso(complete: result):
            return result
        case let .lifeSupportSystem(complete: result):
            return result
        case let .gloves(complete: result):
            return result
        case let .helmet(complete: result):
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
    enum Role {
        case checklist
        case fitting
    }
    
    enum Item {
        case coolingGarment
        case lowerTorso
        case hardUpperTorso
        case lifeSupportSystem
        case gloves
        case helmet
        
        var image: UIImage {
            switch self {
            case .gloves:
                return R.image.glove()!
            case .helmet:
                return R.image.helmet()!
            case .coolingGarment:
                <#code#>
            case .lowerTorso:
                <#code#>
            case .hardUpperTorso:
                <#code#>
            case .lifeSupportSystem:
                <#code#>
            }
        }
    }
        
        var title: String {
            switch self {
            case .gloves:
                return "Gloves"
            case .helmet:
                return "Helmet"
            case .coolingGarment:
                <#code#>
            case .lowerTorso:
                <#code#>
            case .hardUpperTorso:
                <#code#>
            case .lifeSupportSystem:
                <#code#>
            }
        }
        
        var description: String {
            switch self {
            case .gloves:
                return "Put the glove on your hand"
            case .helmet:
                return "Something to think about"
            case .coolingGarment:
                <#code#>
            case .lowerTorso:
                <#code#>
            case .hardUpperTorso:
                <#code#>
            case .lifeSupportSystem:
                <#code#>
            }
        }
        
        var facts: ItemFacts {
            switch self {
            case .gloves:
                return ItemFacts(weight: "25 kg", color: "white", cost: "9000000$", material: "fabric")
            case .helmet:
                return ItemFacts(weight: "100 kg", color: "black", cost: "9$", material: "metal")
            case .coolingGarment:
                <#code#>
            case .lowerTorso:
                <#code#>
            case .hardUpperTorso:
                <#code#>
            case .lifeSupportSystem:
                <#code#>
            }
        }
    }
    
    struct ItemFacts {
        let weight: String
        let color: String
        let cost: String
        let material: String
    }
    
    struct ViewProvider {
        @ViewBuilder
        static func nextView(current: Page) -> some View { BodyTrackedARViewContainer() }
        
        @ViewBuilder
        static func connectivityView() -> some View { ConnectivityView() }
    }
