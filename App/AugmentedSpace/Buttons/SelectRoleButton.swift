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
                Text(textsmall)
            }
            .padding(50.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(R.color.buttonColor.color)
            .cornerRadius(10)
        }
    }
}

#if DEBUG
struct SelectRoleButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectRoleButton(
            textlarge: "Fitting Specialist",
            textsmall: ""
        ) {
        }
    }
}
#endif
