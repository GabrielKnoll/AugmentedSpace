//
//  EndSessionButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import RealityKit
import SwiftUI

struct EndSessionButton: View {
    var text: String
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .padding(50.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(R.color.customBlue.color)
            .cornerRadius(10)
        }
    }
}

#if DEBUG
struct EndSessionButton_Previews: PreviewProvider {
    static var previews: some View {
        EndSessionButton(
            text: "End Session"
        ) {
        }
    }
}
#endif
