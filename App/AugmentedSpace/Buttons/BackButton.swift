//
//  BackButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct BackButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Image("Icon_BackArrow")
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                    Text("Back")
                        .frame(alignment: .center)
                        .font(Font.custom("Poppins-SemiBold", size: 15))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
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
        BackButton {
        }
    }
}
#endif
