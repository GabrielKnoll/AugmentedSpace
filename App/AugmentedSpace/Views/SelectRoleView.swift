//
//  SelectRoleView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//
import SwiftUI

struct SelectRoleView: View {

    @StateObject var state = AppState()
    @State private var isShowingFittingSpecialistIntroView = false
    @State private var isShowingChecklistNavigatorIntroView = false

    var body: some View {
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
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))

            NavigationLink(
                destination: FittingSpecialistIntroView()
                    .navigationBarBackButtonHidden(true),
                           isActive: $isShowingFittingSpecialistIntroView) { EmptyView() }

            SelectRoleButton(textlarge: "Fitting Specialist", textsmall: "Try to assemble the components of the spacesuit correctly") {
                state.role = .checklist
                isShowingFittingSpecialistIntroView = true
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))

            NavigationLink(
                destination: ChecklistNavigatorIntroView()
                    .navigationBarBackButtonHidden(true),
                           isActive: $isShowingChecklistNavigatorIntroView ) { EmptyView() }

            SelectRoleButton(textlarge: "Checklist Navigator", textsmall: "Give instructions which components are needed") {
                state.role = .checklist
                isShowingChecklistNavigatorIntroView = true
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
            Spacer(minLength: 30)
        }
        .background(
            Image("spaceBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped(antialiased: true)
        )
        .edgesIgnoringSafeArea(.all)

    }

}

struct SelectRoleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRoleView()
    }
}
