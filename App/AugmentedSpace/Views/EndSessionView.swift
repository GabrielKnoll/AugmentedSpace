//
//  EndSessionView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 02.08.23.
//

import SwiftUI

struct EndSessionView: View {
    @EnvironmentObject var state: AppState
    @State private var isShowingPhotoView = false
    @State private var isShowingStartMenuView = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Thanks for using")
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
                    Spacer()
                }
                .padding(EdgeInsets(top: 75, leading: 50, bottom: 0, trailing: 50))
                Spacer()
                NavigationLink(
                    destination: PhotoView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $isShowingPhotoView) { EmptyView() }

                EndSessionButton(text: "Take Another Photo") {
                    state.role = .checklist
                    isShowingPhotoView = true
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))

                NavigationLink(
                    destination: StartMenuView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $isShowingStartMenuView ) { EmptyView() }

                EndSessionButton(text: "End Session") {
                    state.role = .checklist
                    isShowingStartMenuView = true
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 30, trailing: 20))
            }
        }
    }
}

struct EndSessionView_Previews: PreviewProvider {
    static var previews: some View {
        EndSessionView()
    }
}
