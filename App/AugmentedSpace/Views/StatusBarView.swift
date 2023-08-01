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
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
