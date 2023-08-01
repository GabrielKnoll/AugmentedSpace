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
    case helmet(complete: Bool)
    case torso(complete: Bool)

    var number: Int {
        switch self {
        case .helmet:
            return 1
        case .torso:
            return 2
        }
    }

    var complete: Bool {
        switch self {
        case let .helmet(complete: result):
            return result
        case let .torso(complete: result):
            return result
        }
    }
}

enum Role {
    case checklist
    case fitting
}

enum Item {
    case glove
    case helmet

    var image: UIImage {
        switch self {
        case .glove:
            return R.image.glove()!
        case .helmet:
            return R.image.helmet()!
        }
    }

    var title: String {
        switch self {
        case .glove:
            return "Gloves"
        case .helmet:
            return "Helmet"
        }
    }

    var description: String {
        switch self {
        case .glove:
            return "Put the glove on your hand"
        case .helmet:
            return "Something to think about"
        }
    }

    var facts: ItemFacts {
        switch self {
        case .glove:
            return ItemFacts(weight: "25 kg", color: "white", cost: "9000000$", material: "fabric")
        case .helmet:
            return ItemFacts(weight: "100 kg", color: "black", cost: "9$", material: "metal")
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
