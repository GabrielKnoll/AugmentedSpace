//
//  StartMenuView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct StartMenuView: View {
    var body: some View {

        Text("Welcome to")
        Text("AR-Stronaut")
            .font(.system(size: 48))
              .padding(50)
              .background(
                Image("spaceBackground")
                      .resizable()
                      .scaledToFit()
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
              )
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
