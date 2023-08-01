//
//  ItemScrollView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct ItemScrollView: View {
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<10) {
                        ItemCardView(item: .glove)
                            .frame(width: 325, height: 450)
                            .id($0)
                    }
                }
            }
            .onAppear {
                value.scrollTo(5, anchor: .center)
            }
        }
    }
}

struct ItemScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ItemScrollView()
    }
}
