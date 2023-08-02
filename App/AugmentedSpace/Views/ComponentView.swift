//
//  ComponentView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

struct ComponentView: View {

    @EnvironmentObject var state: AppState
    @State private var isShowingEndSessionView = false
    @State var currentIndex = 0
    @State var maximumIndex = 4
    @State var displayedStep: Step?

    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("What important equipment do we search?")
                        .font(Font.custom("Poppins-Medium", size: 18))
                        .foregroundColor(R.color.customOrange.color)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 250)
                    Spacer()
                }.padding(.bottom, 75)
                Spacer()
                VStack(alignment: .leading) {
                    Text(state.steps[currentIndex].componentTitleCL)
                        .font(Font.custom("Poppins-Bold", size: 36))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 60))
                    Text(state.steps[currentIndex].componentTextCL)
                        .font(Font.custom("Poppins-Regular", size: 21))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))

                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        if currentIndex > 0 {
                            BackButton {
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                }
                            }
                            .padding(.trailing, 5)
                            .frame(maxWidth: 120)
                        }
                        NavigationLink(
                            destination: EndSessionView()
                                .navigationBarBackButtonHidden(true),
                            isActive: $isShowingEndSessionView ) { EmptyView() }
                        ContinueButton {
                            print("Current index: \(currentIndex)")
                            if currentIndex == maximumIndex {
                                state.role = .checklist
                                isShowingEndSessionView = true
                            }
                            if currentIndex < maximumIndex {
                                currentIndex += 1
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            }.padding(EdgeInsets(top: 75, leading: 0, bottom: 30, trailing: 0))
        }
        .overlay(alignment: .top) {
            StatusBarView()
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        }
    }
}

struct ComponentView_Previews: PreviewProvider {

    static let state = AppState()

    static var previews: some View {
        ComponentView()
            .environmentObject(state)
    }
}
