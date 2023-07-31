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
            .background(Color(red: 0.203_921_568_627_450_98, green: 0.196_078_431_372_549_02, blue: 0.278_431_372_549_019_6))
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
