//
//  PhotoView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 02.08.23.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        VStack {
            Text("Ready for Takeoff")
        }
        .overlay(alignment: .top) {
            StatusBarView()
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
        }

    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
