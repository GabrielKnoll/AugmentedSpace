//
//  BackButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct BackButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 17))
                        .bold()
                    Text("Back")
                        .font(Font.custom("Poppins-SemiBold", size: 17))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 30)
            .foregroundColor(.white)
            .padding()
            .background(R.color.customGrey.color)
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton {
        }
    }
}
#endif
