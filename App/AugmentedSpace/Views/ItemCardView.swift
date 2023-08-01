//
//  ItemCardView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct ItemCardView: View {
    let item: Item

    @State var flipped = false
    @State var animate3d = false

    var body: some View {
        VStack {
            ZStack {
                ItemFrontView(item: .helmet, animate3d: $animate3d).opacity(flipped ? 0.0 : 1.0)
                ItemBackView(item: .gloves, animate3d: $animate3d).opacity(flipped ? 1.0 : 0.0)
            }
            .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
        }
    }
}

struct ItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCardView(item: .helmet)
    }
}
