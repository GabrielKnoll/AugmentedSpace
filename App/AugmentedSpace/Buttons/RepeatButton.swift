//
//  RepeatButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct RepeatButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
                HStack {
                    Text("Repeat")
                    Image(systemName: "arrow.2.squarepath")
                }
                .foregroundColor(Color.white)
                .padding(15)
                .background(R.color.customGrey.color)
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
                RepeatButton {}
            }
            Spacer(minLength: 200)
        }
    }
}
#endif
