//
//  SelectEquipmentButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct SelectEquipmentButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Text("Select Equipment")
                        .font(Font.custom("Poppins-Medium", size: 18))
                    Image("Icon_Helmet")
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .foregroundColor(Color.white)
            .padding()
            .background(R.color.customLightBlue.color)
            .cornerRadius(10)
        }
        .buttonStyle(CustomButtonStyle())
    }
}
#if DEBUG
struct SelectEquipmentButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectEquipmentButton {
        }
    }
}
#endif
