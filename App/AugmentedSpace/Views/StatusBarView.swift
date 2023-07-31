//
//  StatusBarView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct StatusBarView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(.red)
                Text("1")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
