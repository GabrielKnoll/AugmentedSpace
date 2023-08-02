//
//  SaveButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct SaveButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
                HStack {
                    Spacer()
                    Text("Save")
                    Image(systemName: "square.and.arrow.down")
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding(15)
                .background(R.color.customOrange.color)
                .cornerRadius(10)
        }
    }
}

#if DEBUG
struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton {}
    }
}
#endif
