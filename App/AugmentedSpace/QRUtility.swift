//
//  QRUtility.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI
import UIKit

struct QRUtility {
    static func generateQRCode(from string: String) -> Image? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return Image(uiImage: UIImage(ciImage: output))
            }
        }

        return nil
    }

}
