//
//  ChoosePieceButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ChoosePieceButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Text("Choose Piece")
                        .font(Font.custom("Poppins-Medium", size: 18))
                    Image("lcon_Augment")
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
    }
}
#if DEBUG
struct ChoosePieceButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChoosePieceButton {
            }
        }
    }
}
#endif
