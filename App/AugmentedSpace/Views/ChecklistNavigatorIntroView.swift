//
//  ChecklistNavigatorIntroView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

struct ChecklistNavigatorIntroView: View {
    @EnvironmentObject var state: AppState
    @Environment(\.dismiss) var dismiss
    @State private var isShowingComponentView = false

    var body: some View {
        ZStack {
           BackgroundView()
            VStack(alignment: .center) {
                Image("Icon_Checklist")
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 200, leading: 150, bottom: 0, trailing: 150))
                VStack(alignment: .leading) {
                    Text("You are the")
                        .font(Font.custom("Poppins-Regular", size: 26))
                        .foregroundColor(Color.white)
                    Text("Checklist Navigator\n")
                        .font(Font.custom("Poppins-Bold", size: 29))
                        .foregroundColor(R.color.customOrange.color)
                    Text("Help your Fitting Specialist to find the right parts by explaining to him the items on your checklist.")
                        .font(Font.custom("Poppins-Medium", size: 21))
                        .foregroundColor(Color.white)
                }.padding([.leading, .bottom, .trailing], 40)
                Spacer()
                NavigationLink(destination: ComponentView().navigationBarBackButtonHidden(true), isActive: $isShowingComponentView) { EmptyView() }
                HStack(spacing: 15) {
                    BackButton {
                        dismiss()
                    }
                    .frame(maxWidth: 120)
                    .padding(.leading, 30)
                    ContinueButton {
                        state.role = .checklist
                        isShowingComponentView = true
                    }
                    .padding(.trailing, 30)
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
            }
        }
    }
}

struct ChecklistNavigatorIntroView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistNavigatorIntroView()
    }
}
