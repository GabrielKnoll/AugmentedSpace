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
                .font(Font.custom("Poppins-Medium", size: 35))
                .foregroundColor(.white)
                .padding(.top, 40)
            Image(uiImage: item.image!)
                .resizable()
                .scaledToFit()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            ShowInformationButton {
                withAnimation(.linear(duration: 0.35)) {
                    animate3d.toggle()
                }
            } .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
        }
        .background(Color.black)
        .cornerRadius(20)
    }
}

struct ItemFrontView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFrontView(item: .gloves, animate3d: Binding.constant(false))
    }
}
