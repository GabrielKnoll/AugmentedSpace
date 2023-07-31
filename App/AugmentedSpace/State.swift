//
//  State.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import Foundation

class State: ObservableObject {
    var sessionId: UUID?
    var role: Role?
    @Published var step: Step?
}
