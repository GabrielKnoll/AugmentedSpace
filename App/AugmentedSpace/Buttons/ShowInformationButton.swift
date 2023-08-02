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
            HStack(spacing: 10) {
                Text("Show Information")
                    .lineLimit(1)
                    .font(Font.custom("Poppins-Medium", size: 15))
                Image("Icon_Info")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 30)
            }
        }
        .fixedSize()
        .frame(maxWidth: .infinity, maxHeight: 40)
        .padding(5)
        .foregroundColor(Color.white)
        .background(R.color.customBlue.color)
        .cornerRadius(10)
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
