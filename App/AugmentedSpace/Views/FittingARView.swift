//
//  FittingARView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct FittingARView: View {
    @EnvironmentObject var state: AppState

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
                ShowInformationButton() {
                    if shouldShowEquipment {
                        state.finishCurrentStep()
                        shouldShowEquipment = false
                    } else {
                        shouldShowEquipment.toggle()
                    }
                }
                if shouldShowEquipment {
                    Button("Close", role: .cancel) {
                        shouldShowEquipment = false
                    }
                }
            }
            .padding(15)
        }
        .overlay(alignment: .top) {
            StatusBarView()
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
        }
        NavigationLink(destination: PhotoIntroView().navigationBarBackButtonHidden(true), isActive: $state.enablePhoto) { EmptyView() }
    }
}

struct FittingARView_Previews: PreviewProvider {
    static var previews: some View {
        FittingARView()
    }
}
