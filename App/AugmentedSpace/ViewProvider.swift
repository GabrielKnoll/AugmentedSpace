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
    case helmet
    case torso
}

enum Role {
    case checklist
    case fitting
}

struct ViewProvider {
    @ViewBuilder
    static func nextView(current: Page) -> some View { BodyTrackedARViewContainer() }

    @ViewBuilder
    static func connectivityView() -> some View { ConnectivityView() }
}
