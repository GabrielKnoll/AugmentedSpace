//
//  StartMenuView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct StartMenuView: View {
    var body: some View {

        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
