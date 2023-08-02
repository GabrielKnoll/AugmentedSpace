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
    case lifeSupportSystem
    case gloves
    case helmet

    var image: UIImage? {
        switch self {
        case .gloves:
            return R.image.glove()!
        case .helmet:
            return R.image.helmet()!
        case .coolingGarment:
            return R.image.coolingGarment()!
        case .lowerTorso:
            return R.image.lowerTorso()!
        case .hardUpperTorso:
            return R.image.hardUpperTorso()!
        case .lifeSupportSystem:
            return nil
        }
    }

    var description: String {
        switch self {
        case .gloves:
            return "Put the glove on your hand"
        case .helmet:
            return "Something to think about"
        case .coolingGarment:
            return ""
        case .lowerTorso:
            return ""
        case .hardUpperTorso:
            return ""
        case .lifeSupportSystem:
            return ""
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
        case .lifeSupportSystem:
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
        case .lifeSupportSystem:
            return "Life Support System"
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
