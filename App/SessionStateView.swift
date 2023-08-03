//
//  SessionStateView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 03.08.23.
//

import SwiftUI

struct SessionStateView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        HStack {
            VStack {
                if state.sessionConnected {
                    Spacer()
                    Text("Session connected. Second player is \($state.partnerName.wrappedValue).")
                        .font(Font.custom("Poppins-SemiBold", size: 35))
                        .foregroundColor(.white)
                        .padding(.top, 100)
                    Spacer()
                } else {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Session")
                            .font(Font.custom("Poppins-SemiBold", size: 46))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 100, leading: 0, bottom: -20, trailing: 0))
                        Text("Connecting")
                            .font(Font.custom("Poppins-SemiBold", size: 46))
                            .foregroundColor(R.color.customOrange.color)
                    }
                    Spacer()
                    ProgressView()
                        .tint(.white)
                        .controlSize(.large)
                        .scaleEffect(1.25)
                        .onAppear {
                            state.sessionManager?.startSession()
                        }
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct SessionStateView_Previews: PreviewProvider {
    static var previews: some View {
        let state = AppState()

        SessionStateView()
            .environmentObject(state)
            .background(.black)
            .onAppear {
                state.sessionConnected = true
                state.partnerName = "Larry"
            }
    }
}
