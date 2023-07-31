//
//  SaveButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct SaveButton: View {
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
            .foregroundColor(Color.black)
            .padding()
            .background(Color(red: 0.953, green: 0.262, blue: 0.129))
            .cornerRadius(10)
        }
    }
}

#if DEBUG
struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(
            text: "Save",
            icon: "Icon_Download"
        ) {
        }
    }
}
#endif
