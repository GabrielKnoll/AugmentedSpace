//
//  StartGameButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct StartGameButton: View {
    var text: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .frame(maxWidth: .infinity)
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
        StartGameButton(
            text: "Start Game"
        ) {
        }
    }
}
#endif
