//
//  ShowInformationButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ShowInformationButton: View {
    var text: String
    var icon: UIImage
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack(spacing: 10) {
                Text(text)
                    .lineLimit(1)
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .fixedSize()
        .frame(maxWidth: .infinity)
        .padding(5)
        .foregroundColor(Color.white)
        .background(R.color.customBlue.color)
        .cornerRadius(10)
    }
}
#if DEBUG
struct ShowInformationButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowInformationButton(text: "Show Information", icon: R.image.icon_Info()!) {}
    }
}
#endif
