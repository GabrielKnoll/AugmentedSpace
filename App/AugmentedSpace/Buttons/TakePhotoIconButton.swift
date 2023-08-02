//
//  TakePhotoIconButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct TakePhotoIconButton: View {
    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked) {
            HStack {
                Spacer()
                Image(systemName: "camera.fill")
                    .font(.title)
                Spacer()
            }
        }
        .padding(15)
        .foregroundColor(Color.white)
        .background(R.color.customOrange.color)
        .cornerRadius(10)
    }
}

#if DEBUG
struct TakePhotoIconButton_Previews: PreviewProvider {
    static var previews: some View {
        TakePhotoIconButton {}
    }
}
#endif
