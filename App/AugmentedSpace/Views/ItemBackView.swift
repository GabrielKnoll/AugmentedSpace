//
//  ItemBackView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct ItemBackView: View {
    let item: Item
    @Binding var animate3d: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Spacer()
                Text(item.title)
                    .font(Font.custom("Poppins-Regular", size: 36))
                Spacer()
            }.padding(.top, 30)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Material:")
                    Text("Weight:")
                    Text("Color:")
                }
                .padding(.trailing, 15)
                .font(Font.custom("Poppins-Bold", size: 21))
                VStack(alignment: .leading) {
                    Text(item.facts!.weight)
                    Text(item.facts!.material)
                    Text(item.facts!.color)
                }.font(Font.custom("Poppins-Regular", size: 21))
                Spacer()
            }.padding(.horizontal, 40)
            Spacer()
            Text(item.description)
                .padding(.horizontal, 40)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Poppins-Regular", size: 21))
            Spacer()
            ShowInformationButton(text: "Show Image", icon: R.image.icon_Image()!) {
                withAnimation(.linear(duration: 0.35)) {
                    animate3d.toggle()
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(15)
    }
}

struct ItemBackView_Previews: PreviewProvider {
    static var previews: some View {
        ItemBackView(item: .helmet, animate3d: Binding.constant(false))
    }
}
