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
        ZStack {
            VStack {
                Text(item.title)
                    .font(Font.custom("Poppins-Medium", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Spacer()
                Image(uiImage: item.image!)
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                ShowInformationButton {
                    withAnimation(.linear(duration: 0.35)) {
                        animate3d.toggle()
                    }
                }
            }
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
            .background(Color.black)
            .cornerRadius(20)
            VStack {
                Spacer(minLength: 90)
                Spacer(minLength: 90)
            }
        }
    }
}

struct ItemFrontView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFrontView(item: .gloves, animate3d: Binding.constant(false))
    }
}
