//
//  FittingSpecialistIntroView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

struct FittingSpecialistIntroView: View {
    @EnvironmentObject var state: AppState
    @Environment(\.dismiss) var dismiss
    @State private var isShowingStartMenuView = false

    var body: some View {
        ZStack {
            BackgroundView()
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
                NavigationLink(destination: FittingARView().navigationBarBackButtonHidden(true), isActive: $isShowingStartMenuView) { EmptyView() }
                HStack(spacing: 15) {
                    BackButton {
                        dismiss()
                    }
                    .frame(maxWidth: 120)
                    .padding(.leading, 30)
                    ContinueButton {
                        state.role = .checklist
                        isShowingStartMenuView = true
                    }
                    .padding(.trailing, 30)
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
            }
        }
    }
}

struct FittingSpecialistIntroView_Previews: PreviewProvider {
    static var previews: some View {
        FittingSpecialistIntroView()
    }
}
