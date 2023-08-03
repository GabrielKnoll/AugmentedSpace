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
            .frame(maxWidth: .infinity, maxHeight: 30)
            .font(Font.custom("Poppins-SemiBold", size: 18))
            .foregroundColor(Color.black)
            .padding()
            .background(R.color.customOrange.color)
            .cornerRadius(10)
        }
        .buttonStyle(CustomButtonStyle())
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
