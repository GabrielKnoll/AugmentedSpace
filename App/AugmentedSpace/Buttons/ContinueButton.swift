//
//  ContinueButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ContinueButton: View {
    @Environment(\.isEnabled) private var isEnabled
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text("Continue")
                    .font(Font.custom("Poppins-SemiBold", size: 17))
                Image(systemName: "chevron.forward")
                    .font(Font.system(size: 17))
                    .bold()
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .foregroundColor(isEnabled ? .black : R.color.customFontDisabled.color)
            .padding()
            .background(isEnabled ? R.color.customOrange.color : R.color.customOrangeDisabled.color)
            .cornerRadius(10)
        }
        .buttonStyle(CustomButtonStyle())
    }
}
#if DEBUG
struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton {
        }
    }
}
#endif
