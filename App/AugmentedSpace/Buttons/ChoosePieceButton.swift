//
//  ChoosePieceButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ChoosePieceButton: View {
    var text: String
    var icon: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Text(text)
                        .frame(alignment: .center)

                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                        .padding(10)
                }
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .padding()
            .background(Color(red: 0.247, green: 0.467, blue: 0.821))
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct ChoosePieceButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer(minLength: 675)
            ChoosePieceButton(
                text: "Choose Piece",
                icon: "lcon_Augment"
            ) {
            }
        }
    }
}
#endif
