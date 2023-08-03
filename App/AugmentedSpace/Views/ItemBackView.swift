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
                    .font(Font.custom("Poppins-Medium", size: 25))
                Spacer()
            }
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    if let facts = item.facts {
                        HStack(alignment: .top) {
                            Text("Weight:")
                                .font(Font.custom("Poppins-Bold", size: 15))
                            Spacer(minLength: 20)
                            Text(facts.weight)
                                .font(Font.custom("Poppins-Regular", size: 15))
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Material:")
                                .font(Font.custom("Poppins-Bold", size: 15))
                            Spacer()
                            Text(facts.material)
                                .font(Font.custom("Poppins-Regular", size: 15))
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            Text("Color:")
                                .font(Font.custom("Poppins-Bold", size: 15))
                            Spacer()
                            Text(facts.color)
                                .font(Font.custom("Poppins-Regular", size: 15))
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.padding(.horizontal, 30)
            Spacer()
            Text(item.description)
                .padding(.horizontal, 30)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Poppins-Regular", size: 15))
            Spacer()
            ShowInformationButton {
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
