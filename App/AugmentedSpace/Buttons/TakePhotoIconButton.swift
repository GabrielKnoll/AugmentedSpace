//
//  TakePhotoIconButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct TakePhotoIconButton: View {
    var icon: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                        .padding(10)
                }
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .padding()
            .background(Color(red: 0.953, green: 0.262, blue: 0.129))
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct TakePhotoIconButton_Previews: PreviewProvider {
    static var previews: some View {
        TakePhotoIconButton(
            icon: "Icon_Camera"
        ) {
        }
    }
}
#endif
