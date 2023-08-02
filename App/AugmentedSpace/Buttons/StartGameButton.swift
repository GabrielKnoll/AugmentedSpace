//
//  StartGameButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct StartGameButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text("Start Game")
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .font(Font.custom("Poppins-SemiBold", size: 15))
            .foregroundColor(Color.white)
            .padding()
            .background(R.color.customBlue.color)
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct StartGameButton_Previews: PreviewProvider {
    static var previews: some View {
        StartGameButton {
        }
    }
}
#endif
