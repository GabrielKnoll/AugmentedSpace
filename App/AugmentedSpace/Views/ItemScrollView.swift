//
//  ItemScrollView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct ItemScrollView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(Item.allCases, id: \.id) { item in
                        if item.id < 1 {
                            ItemCardView(item: item)
                                .frame(width: 325, height: 400)
                                .padding(.leading, 50)
                                .id(item)
                        }
                        if item.id > 3 {
                            ItemCardView(item: item)
                                .frame(width: 325, height: 400)
                                .padding(.trailing, 50)
                                .id(item)
                        }
                        if item.id > 0 && item.id < 4 {
                            ItemCardView(item: item)
                                .frame(width: 325, height: 400)
                                .id(item)
                        }
                    }
                }
                .frame(maxHeight: 700)
                .background(GeometryReader { proxy -> Color in
                    DispatchQueue.main.async {
                        let offset = -proxy.frame(in: .named("scroll")).minX
                        let newCard = Int(round(offset / 335))
                        if newCard != state.selectedCard {
                            state.selectedCard = newCard
                            print("new card selected: \(state.selectedCard)")
                            withAnimation {
                                value.scrollTo(state.selectedCard, anchor: .center)
                            }
                        }
                    }
                    return Color.clear
                })
            }
            .coordinateSpace(name: "scroll")
            .onAppear {
                value.scrollTo(state.selectedCard, anchor: .center)
                Item(rawValue: state.selectedCard)
            }
        }
    }
}

struct ItemScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ItemScrollView()
    }
}
