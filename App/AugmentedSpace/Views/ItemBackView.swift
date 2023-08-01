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
            HStack {
                Text(item.title)
                    .font(.title)
                    .frame(alignment: .center)
            }
            Spacer()
            HStack {
                Text("Material").bold()
                Text(item.facts!.material)
            }
            HStack {
                Text("Weight").bold()
                Text(item.facts!.weight)
            }
            HStack {
                Text("Color").bold()
                Text(item.facts!.color)
            }
            Spacer()
            Text(item.description)
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
