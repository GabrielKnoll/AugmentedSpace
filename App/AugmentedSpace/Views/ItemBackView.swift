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
                    .font(Font.custom("Poppins-Regular", size: 25))
                Spacer()
            }
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Weight:")
                    Text("Material:")
                    Text("Color:")
                }
                .padding(.trailing, 15)
                .font(Font.custom("Poppins-Medium", size: 15))
                if let facts = item.facts {
                    VStack(alignment: .leading) {
                        Text(facts.weight)
                        Text(facts.material)
                        Text(facts.color)
                    }.font(Font.custom("Poppins-Regular", size: 15))
                }
                Spacer()
            }.padding(.horizontal, 40)
            Spacer()
            Text(item.description)
                .padding(.horizontal, 40)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Poppins-Regular", size: 15))
            Spacer()
            ShowInformationButton() {
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
