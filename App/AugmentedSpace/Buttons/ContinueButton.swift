//
//  ContinueButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ContinueButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text("Continue")
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .font(Font.custom("Poppins-SemiBold", size: 18))
            .foregroundColor(Color.white)
            .padding()
            .background(R.color.customBlue.color)
            .cornerRadius(10)
        }
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
