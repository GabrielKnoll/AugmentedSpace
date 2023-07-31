//
//  ContinueButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct ContinueButton: View {
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
            .background(Color(red: 0.20392156862745098, green: 0.19607843137254902, blue: 0.2784313725490196))
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton(
            text: "Continue"
        ) {
        }
    }
}
#endif
