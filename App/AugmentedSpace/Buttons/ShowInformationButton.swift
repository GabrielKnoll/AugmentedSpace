//
//  ShowInformationButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ShowInformationButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text("Show Information")
                Image("Icon_Info")
                    .resizable()
                    .scaledToFit()
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .font(Font.custom("Poppins-Regular", size: 18))
            .foregroundColor(.white)
            .padding()
            .background(R.color.customBlue.color)
            .cornerRadius(10)
        }
        .buttonStyle(CustomButtonStyle())
    }
}
#if DEBUG
struct ShowInformationButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowInformationButton {
        }
    }
}
#endif
