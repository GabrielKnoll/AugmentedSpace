//
//  BackButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(1)
            .brightness(configuration.isPressed ? -0.15 : 0)
    }
}

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
        .buttonStyle(CustomButtonStyle())
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
