//
//  HelmetButton.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 03.08.23.
//

import SwiftUI

struct HelmetButton: View {
    var clicked: (() -> Void)
    @State private var isOn = false

    var body: some View {
        Button(action: {
            isOn.toggle()
            clicked()
        }) {
            if isOn {
                VStack {
                    HStack {
                        Image("Icon_Helmet2")
                            .resizable()
                            .scaledToFit()
                            .frame(alignment: .center)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 30)
                .foregroundColor(Color.white)
                .padding()
                .background(R.color.customGrey.color)
                .cornerRadius(10)
            } else {
                VStack {
                    HStack {
                        Image("Icon_Not_Helmet")
                            .resizable()
                            .scaledToFit()
                            .frame(alignment: .center)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 30)
                .foregroundColor(Color.white)
                .padding()
                .background(R.color.customGrey.color)
                .cornerRadius(10)
            }
        }
    }
}

struct HelmetButton_Previews: PreviewProvider {
    static var previews: some View {
        HelmetButton() {
        }
    }
}
