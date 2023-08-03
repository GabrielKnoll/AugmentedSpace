//
//  FittingARView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 01.08.23.
//

import SwiftUI

struct FittingARView: View {
    @EnvironmentObject var state: AppState

    @State private var wrongSelection = false
    @State private var shouldShowEquipment = false {
        didSet {
            buttonText = shouldShowEquipment ? "Choose Component" : "Select Equipment"
        }
    }

    @State private var buttonText = "Select Equipment"

    let arViewContainer = BodyTrackedARViewContainer()

    var body: some View {
        ZStack {
            if wrongSelection {
                Text("Wrong Selection!")
                    .font(Font.custom("Poppins-Bold", size: 40))
                    .zIndex(2)
                Rectangle()
                    .fill(Color.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .zIndex(1)
                    .opacity(0.75)
            }
            ZStack {
                arViewContainer
                    .ignoresSafeArea(.all)
                    .blur(radius: shouldShowEquipment ? 10 : 0)
                if shouldShowEquipment {
                    ItemScrollView()
                }
            }.blur(radius: wrongSelection ? 10 : 0)
            .overlay(alignment: .bottom) {
                HStack {
                    if shouldShowEquipment {
                        BackButton {
                            shouldShowEquipment = false
                        }
                    }
                    if !shouldShowEquipment {
                        SelectEquipmentButton {
                            if shouldShowEquipment {
                                state.finishCurrentStep()
                                shouldShowEquipment = false
                            } else {
                                shouldShowEquipment.toggle()
                            }
                        }
                    } else {
                        ChoosePieceButton {
                            if state.currentStep!.number - 1 == state.selectedCard {
                                shouldShowEquipment = false
                                state.selectedItemToDisplay!(Item(rawValue: state.selectedCard)!)
                                state.finishCurrentStep()
                            } else {
                                wrongSelection = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        self.wrongSelection = false
                                    }
                                }
                            }
                        }
                    }

                }
                .padding(15)
            }
            .blur(radius: wrongSelection ? 10 : 0)
            .overlay(alignment: .top) {
                StatusBarView()
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
                    .blur(radius: wrongSelection ? 10 : 0)
            }
            NavigationLink(destination: PhotoIntroView().navigationBarBackButtonHidden(true), isActive: $state.enablePhoto) { EmptyView() }
        }
    }
}
    struct FittingARView_Previews: PreviewProvider {
        static var previews: some View {
            FittingARView()
        }
    }
