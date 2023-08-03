//
//  NameView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject var state: AppState
    @Environment(\.dismiss) var dismiss
    @State private var shouldContinue = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("What's")
                        .font(Font.custom("Poppins-SemiBold", size: 46))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: -20, trailing: 0))
                    Text("your name?")
                        .font(Font.custom("Poppins-SemiBold", size: 46))
                        .foregroundColor(R.color.customOrange.color)
                }
                .padding(EdgeInsets(top: 0, leading: -65, bottom: 0, trailing: 0))
                Spacer()
                HStack {
                    Spacer(minLength: 30)
                    TextField("", text: $state.name, prompt: Text("Enter your name").foregroundColor(.white))
                        .padding()
                        .foregroundColor(.white)
                        .background(R.color.customBlue.color)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    Spacer(minLength: 30)
                }
                Spacer()
                HStack(spacing: 15) {
                    BackButton {
                        dismiss()
                    }
                    .frame(maxWidth: 120)
                    .padding(.leading, 30)
                    ContinueButton {
                        shouldContinue = true
                    }
                    .padding(.trailing, 30)
                }
            }
        }
        NavigationLink(
            destination: ConnectivityView()
                .navigationBarBackButtonHidden(true),
            isActive: $shouldContinue) { EmptyView() }
    }
}

struct NameView_Previews: PreviewProvider {
    static let state = AppState()

    static var previews: some View {
        NameView()
            .environmentObject(state)
    }
}
