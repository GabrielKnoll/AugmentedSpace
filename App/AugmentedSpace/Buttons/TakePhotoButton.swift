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
            VStack {
                HStack {
                    Text(text)
                        .frame(alignment: .center)
                }
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.black)
            .padding()
            .background(Color(red: 0.953, green: 0.262, blue: 0.129))
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct TakePhotoButton_Previews: PreviewProvider {
    static var previews: some View {
        TakePhotoButton(
            text: "TAKE A PHOTO"
        ) {
        }
    }
}
#endif
