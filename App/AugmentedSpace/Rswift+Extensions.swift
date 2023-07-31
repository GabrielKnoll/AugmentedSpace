//
//  Rswift+Extensions.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import RswiftResources
import SwiftUI

// MARK: - ImageResource
extension ImageResource {
    var image: Image {
        Image(name)
    }
}

// MARK: - ColorResource
extension ColorResource {
    var color: Color {
        Color(name)
    }
}

// MARK: - FontResource
extension FontResource {
    func font(size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
}
