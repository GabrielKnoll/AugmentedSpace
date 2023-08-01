//
//  BackButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct BackButton: View {
    var text: String
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
                    Text(text)
                        .frame(alignment: .center)
                }
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .padding()
            .background(R.color.customGrey.color)
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(
            text: "Back",
            icon: "Icon_BackArrow"
        ) {
        }
    }
}
#endif
