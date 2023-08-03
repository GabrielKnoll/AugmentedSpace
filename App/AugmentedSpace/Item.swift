//
//  Item.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 03.08.23.
//

import UIKit

enum Item: Int, CaseIterable, Identifiable {

    var id: Int {
        return self.rawValue
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
            return "Not a regular helmet for biking or sports. The spacesuit helmet features a gold-coated visor shielding from sun rays and a built-in ventilation system for oxygen supply."
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
            return ItemFacts(weight: "1 kg", color: "White", cost: "9000000$", material: "Nomex, Gore-Tex, Kevlar")
        case .helmet:
            return ItemFacts(weight: "11 kg", color: "Black, White", cost: "9$", material: "Polycarbonat, Plexiglas")
        case .coolingGarment:
            return ItemFacts(weight: "6 kg", color: "White", cost: "9$", material: "Elastic Nomex")
        case .lowerTorso:
            return ItemFacts(weight: "30 kg", color: "White, Grey, Red", cost: "9$", material: "Nylon, Kevlar, Mylar")
        case .hardUpperTorso:
            return ItemFacts(weight: "110 kg", color: "White, Grey, Red", cost: "9$", material: "Fiberglass")
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
            return "Lower Torso"
        case .hardUpperTorso:
            return "Hard Upper Torso"
        }
    }

    var model: String {
        switch self {
        case .coolingGarment:
            return "01_CG"
        case .lowerTorso:
            return "02_LT"
        case .hardUpperTorso:
            return "03_UT"
        case .gloves:
            return "04_UTG"
        case .helmet:
            return "05_Astronaut"
        }
    }
}

struct ItemFacts {
    let weight: String
    let color: String
    let cost: String
    let material: String
}
