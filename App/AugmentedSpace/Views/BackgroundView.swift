//
//  BackgroundView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 03.08.23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Image(uiImage: R.image.spaceBackground()!)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.65)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
