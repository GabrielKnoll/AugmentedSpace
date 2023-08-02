//
//  FittingSpecialistIntroView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

struct FittingSpecialistIntroView: View {

    @StateObject var state = AppState()
    @State private var isShowingStartMenuView = false

    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
            VStack(alignment: .center) {
                Image("Icon_Styler")
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 200, leading: 150, bottom: 0, trailing: 150))
                VStack(alignment: .leading) {
                    Text("You are the")
                        .font(Font.custom("Poppins-Regular", size: 26))
                        .foregroundColor(Color.white)
                    Text("Fitting Specialist\n")
                        .font(Font.custom("Poppins-Bold", size: 29))
                        .foregroundColor(R.color.customOrange.color)
                    Text("Follow the instructions of your Checklist Navigator and help them into their suit by selecting the right items.")
                        .font(Font.custom("Poppins-Medium", size: 21))
                        .foregroundColor(Color.white)
                }.padding([.leading, .bottom, .trailing], 40)
                Spacer()
                NavigationLink(destination: StartMenuView().navigationBarBackButtonHidden(true), isActive: $isShowingStartMenuView) { EmptyView() }
                ContinueButton {
                    state.role = .checklist
                    isShowingStartMenuView = true
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
            }
        } .edgesIgnoringSafeArea(.all)
    }
}

struct FittingSpecialistIntroView_Previews: PreviewProvider {
    static var previews: some View {
        FittingSpecialistIntroView()
    }
}
