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

enum Role {
    case checklist
    case fitting
}

enum Item: CaseIterable, Identifiable {

    var id: Self {
        return self
    }

    case coolingGarment
    case lowerTorso
    case hardUpperTorso
    case gloves
    case helmet

    var image: UIImage? {
        switch self {
        case .gloves:
            return R.image.card_Gloves()!
        case .helmet:
            return R.image.card_Helmet()!
        case .coolingGarment:
            return R.image.card_Cooling_Garment()!
        case .lowerTorso:
            return R.image.card_Lower_Torso()!
        case .hardUpperTorso:
            return R.image.card_Upper_Torso()!
        }
    }

    var description: String {
        switch self {
        case .gloves:
            return "In space, hands freeze, but not with these special gloves. They have built-in heaters and maintain finger dexterity for tool use."
        case .helmet:
            return "Something to think about"
        case .coolingGarment:
            return "Long spacewalks require hard work. Astronauts wear a cooling garment with water tubes to stay cool."
        case .lowerTorso:
            return "The lower torso shields legs and feet in space. Rings along the waist secure astronauts to the station and hold essential tools during spacewalks."
        case .hardUpperTorso:
            return "The Hard Upper Torso establishes a connection between the suit's internal components and the relevant systems in the Portable Life Support System."
        }
    }

    var facts: ItemFacts? {
        switch self {
        case .gloves:
            return ItemFacts(weight: "25 kg", color: "white", cost: "9000000$", material: "fabric")
        case .helmet:
            return ItemFacts(weight: "100 kg", color: "black", cost: "9$", material: "metal")
        case .coolingGarment:
            return nil
        case .lowerTorso:
            return nil
        case .hardUpperTorso:
            return nil
        }
    }

    var title: String {
        switch self {
        case .gloves:
            return "Gloves"
        case .helmet:
            return "Helmet"
        case .coolingGarment:
            return "Cooling Garment"
        case .lowerTorso:
            return "Lowet Torso"
        case .hardUpperTorso:
            return "Hard Upper Torso"
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
}
