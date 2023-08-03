//
//  SelectRoleView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//
import SwiftUI

struct SelectRoleView: View {
    @EnvironmentObject var state: AppState
    @State private var isShowingFittingSpecialistIntroView = false
    @State private var isShowingChecklistNavigatorIntroView = false
    @State private var showConnectivityView = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .font(Font.custom("Poppins-SemiBold", size: 21))
                        .foregroundColor(Color.white)
                        .padding(.top, 100)
                    HStack {
                        Text("AR-")
                            .font(Font.custom("Poppins-SemiBold", size: 46))
                            .foregroundColor(R.color.customOrange.color)
                        Text("Stronaut")
                            .font(Font.custom("Poppins-SemiBold", size: 46))
                            .foregroundColor(Color.white)
                            .padding(.leading, -8)
                    }
                    .minimumScaleFactor(0.9)
                    Spacer()
                    Text("Select your Role:")
                        .font(Font.custom("Poppins-SemiBold", size: 21))
                        .foregroundColor(R.color.customOrange.color)
                }
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 20, trailing: 50))

                if state.debug {
                    NavigationLink(
                        destination: FittingSpecialistIntroView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $isShowingFittingSpecialistIntroView) { EmptyView() }
                } else {
                    NavigationLink(
                        destination: NameView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $showConnectivityView) { EmptyView() }
                }

                SelectRoleButton(textlarge: "Fitting Specialist", textsmall: "Try to assemble the components of the spacesuit correctly") {
                    state.role = .fitting
                    isShowingFittingSpecialistIntroView = true
                    showConnectivityView = true
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))

                if state.debug {
                    NavigationLink(
                        destination: ChecklistNavigatorIntroView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $isShowingChecklistNavigatorIntroView ) { EmptyView() }
                }

                SelectRoleButton(textlarge: "Checklist Navigator", textsmall: "Give instructions which components are needed") {
                    state.role = .checklist
                    isShowingChecklistNavigatorIntroView = true
                    showConnectivityView = true
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                Spacer(minLength: 30)
            }
        }
    }
}

struct SelectRoleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRoleView()
    }
}
