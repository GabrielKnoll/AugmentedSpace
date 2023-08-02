//
//  FinderView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 02.08.23.
//

import SwiftUI

struct FinderView: View {
    var body: some View {
        VStack {
            HStack {
                Image(R.image.cam_indicator_left)
                Spacer()
                Image(R.image.cam_indicator_right)
            }
            Spacer()
            HStack {
                Image(R.image.cam_indicator_left_down)
                Spacer()
                Image(R.image.cam_indicator_right_down)
            }
        }
        .padding()
    }
}

struct FinderView_Previews: PreviewProvider {
    static var previews: some View {
        FinderView()
    }
}
