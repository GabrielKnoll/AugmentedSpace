//
//  SelectRoleButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct SelectRoleButton: View {
    var textlarge: String
    var textsmall: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                Text(textlarge)
                    .font(Font.custom("Poppins-SemiBold", size: 21))
                Text(textsmall)
                    .font(Font.custom("Poppins-Regular", size: 14))
            }
            .padding(EdgeInsets(top: 50, leading: 30, bottom: 50, trailing: 30))
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(R.color.customBlue.color)
            .cornerRadius(10)
        }
    }
}

#if DEBUG
struct SelectRoleButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectRoleButton(
            textlarge: "Fitting Specialist",
            textsmall: "asdfasdfasdfasdfasdfasdfasdf"
        ) {
        }
    }
}
#endif
