//
//  StatusBarView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct StatusBarView: View {
    let steps: [Step]

    var body: some View {
        HStack {
            ForEach(steps, id: \.number) { step in
                StatusCircleView(step: step)
            }
        }
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(steps: [.helmet(complete: true), .torso(complete: false)])
    }
}
