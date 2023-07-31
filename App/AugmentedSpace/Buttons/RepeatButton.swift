//
//  RepeatButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct RepeatButton: View {
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
            .background(Color(red: 0.284, green: 0.277, blue: 0.321))
            .cornerRadius(10)
        }
    }
}
#if DEBUG
struct RepeatButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            VStack {
                Spacer(minLength: 675)
                RepeatButton(
                    text: "Repeat",
                    icon: "Icon_Retry"
                ) {
                }
            }
            Spacer(minLength: 200)
        }
    }
}
#endif
