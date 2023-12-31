//
//  QRUtility.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import CoreImage.CIFilterBuiltins
import UIKit

struct QRUtility {
    static func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()

        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
