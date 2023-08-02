//
//  NameView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject var state: AppState
    @State private var shouldContinue = false

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("What's")
                    .font(Font.custom("Poppins-SemiBold", size: 46))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: -20, trailing: 0))
                Text("your name?")
                    .font(Font.custom("Poppins-SemiBold", size: 46))
                    .foregroundColor(R.color.customOrange.color)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            Spacer()
            HStack {
                Spacer(minLength: 30)
                TextField("", text: $state.name, prompt: Text("Enter your name").foregroundColor(.white))
                    .padding()
                    .foregroundColor(.white)
                    .background(R.color.customBlue.color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Spacer(minLength: 30)
            }
            Spacer()
            ContinueButton(backgroundColor: R.color.customOrange.color) {
                shouldContinue = true
            }
            .padding(30)
        }
        .background {
            Image(R.image.spaceBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped(antialiased: true)
                .edgesIgnoringSafeArea(.all)
        }
        .ignoresSafeArea()
        NavigationLink(
            destination: ConnectivityView()
                .navigationBarBackButtonHidden(true),
            isActive: $shouldContinue) { EmptyView() }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
