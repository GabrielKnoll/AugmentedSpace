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
                .fill(step.color)
            textForStep()
                .scaledToFit()
                .bold()
                .foregroundColor(.white)

        }
    }

    func textForStep() -> Text {
        if case .photo = step {
            return Text("\(Image(systemName: "camera.fill"))")
        } else {
            return Text(String(step.number))
        }
    }
}

struct StatusCircle_Previews: PreviewProvider {
    static var previews: some View {
        StatusCircleView(step: .helmet(state: .active))
        StatusCircleView(step: .hardUpperTorso(state: .inactive))
        StatusCircleView(step: .gloves(state: .complete))
    }
}
