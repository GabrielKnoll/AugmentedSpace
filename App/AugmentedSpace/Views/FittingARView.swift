//
//  FittingARView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct FittingARView: View {
    @State private var shouldShowEquipment = false {
        didSet {
            buttonText = shouldShowEquipment ? "Choose Component" : "Select Equipment"
        }
    }

    @State private var buttonText = "Select Equipment"

    var body: some View {
        ZStack {
            BodyTrackedARViewContainer()
                .ignoresSafeArea(.all)
                .blur(radius: shouldShowEquipment ? 10 : 0)
            if shouldShowEquipment {
                ItemScrollView()
            }
        }
        .overlay(alignment: .bottom) {
            HStack {
                ShowInformationButton(text: buttonText, icon: R.image.icon_Helmet()!) {
                    shouldShowEquipment.toggle()
                }
                if shouldShowEquipment {
                    Button("Close", role: .cancel) {
                        shouldShowEquipment = false
                    }
                }
            }
            .padding(15)
        }

    }
}

struct FittingARView_Previews: PreviewProvider {
    static var previews: some View {
        FittingARView()
    }
}
