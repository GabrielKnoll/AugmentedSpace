//
//  StatusBarView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
            HStack {
                ForEach(state.steps, id: \.number) { step in
                    StatusCircleView(step: step)
                }
            }
            .padding(7.5)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.75))
            .clipShape(Capsule(style: .continuous))
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
