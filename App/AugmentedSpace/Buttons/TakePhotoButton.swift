//
//  TakePhotoButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct TakePhotoButton: View {
    var text: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .padding()
            .background(Color(red: 0.952_941_176_470_588_2, green: 0.262_745_098_039_215_7, blue: 0.129_411_764_705_882_37))
            .cornerRadius(10)
        }
    }
}
