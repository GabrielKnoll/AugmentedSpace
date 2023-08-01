//
//  ItemFrontView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct ItemFrontView: View {
    let item: Item
    @Binding var animate3d: Bool

    var body: some View {
        VStack {
            Text(item.title)
                .font(.title)
                .foregroundColor(.white)
            Image(uiImage: item.image)
                .resizable()
                .scaledToFit()
            Spacer(minLength: 50)
            ShowInformationButton(text: "Show Information", icon: R.image.icon_Info()!) {
                animate3d.toggle()
            }
        }
        .padding(25)
        .background(Color.black)
        .cornerRadius(15)
    }
}

struct ItemFrontView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFrontView(item: .glove, animate3d: Binding.constant(false))
    }
}
