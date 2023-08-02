//
//  ItemScrollView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct ItemScrollView: View {
    @State private var selectedCard = 5

    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(Item.allCases) { item in
                        ItemCardView(item: item)
                            .frame(width: 325, height: 400)
                            .id(item)
                    }
                }
                .frame(maxHeight: 700)
                .background(GeometryReader { proxy -> Color in
                    DispatchQueue.main.async {
                        let offset = -proxy.frame(in: .named("scroll")).minX
                        let newCard = Int(round(offset / 335))
                        if newCard != selectedCard {
                            selectedCard = newCard
                            print("new card selected: \(selectedCard)")
                            withAnimation {
                                value.scrollTo(selectedCard, anchor: .center)
                            }
                        }
                    }
                    return Color.clear
                })
            }
            .coordinateSpace(name: "scroll")
            .onAppear {
                value.scrollTo(selectedCard, anchor: .center)
            }
        }
    }
}

struct ItemScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ItemScrollView()
    }
}
