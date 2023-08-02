//
//  StartMenuView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct StartMenuView: View {

    @StateObject var state = AppState()
    @State private var isShowingSelectRoleView = false

    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
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
                    Text("This is a two player game.\n")
                        .font(Font.custom("Poppins-SemiBold", size: 21))
                        .foregroundColor(R.color.customOrange.color)
                    Text("Find a teammate and select your side.")
                        .font(Font.custom("Poppins-SemiBold", size: 21))
                        .foregroundColor(Color.white)
                }
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                Spacer(minLength: 100)
                NavigationLink(destination: SelectRoleView().navigationBarBackButtonHidden(true), isActive: $isShowingSelectRoleView) { EmptyView() }
                StartGameButton() {
                    state.role = .checklist
                    isShowingSelectRoleView = true
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
            }
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
