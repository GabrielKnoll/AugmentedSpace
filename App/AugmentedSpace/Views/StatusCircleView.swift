//
//  StatusCircleView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct StatusCircleView: View {
    let step: Step

    var body: some View {
        ZStack {
            Circle()
                .fill(step.complete ? .green : .red)
            Text(String(step.number))
                .scaledToFit()
                .font(.system(size: 400))
                .minimumScaleFactor(0.01)
                .padding(50)
                .foregroundColor(.white)

        }
    }
}

struct StatusCircle_Previews: PreviewProvider {
    static var previews: some View {
        StatusCircleView(step: .helmet(complete: false))
        StatusCircleView(step: .torso(complete: true))
    }
}
