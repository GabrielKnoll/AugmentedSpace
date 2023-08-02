//
//  ComponentView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

struct ComponentView: View {

    @EnvironmentObject var state: AppState
    @State var currentIndex = 0
    @State var maximumIndex = 0
    @State var displayedStep: Step?

    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Rectangle()
                    .fill(.white)
                    .frame(width: .infinity, height: 75)
                Text("What important equipment do we search?")
                    .font(Font.custom("Poppins-Medium", size: 14))
                    .foregroundColor(R.color.customOrange.color)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 200)
                Spacer()
                Text(state.steps[currentIndex].componentTitleCL)
                Text(state.steps[currentIndex].componentTextCL)
                Spacer()
                HStack{
                    BackButton(text:, icon: <#T##String#>, clicked: <#T##(() -> Void)##(() -> Void)##() -> Void#>)
                    ContinueButton(text: ("Continue")) {
                        if currentIndex < maximumIndex {
                            currentIndex += 1
                        }
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct ComponentView_Previews: PreviewProvider {

    static let state = AppState()

    static var previews: some View {
        ComponentView()
            .environmentObject(state)
    }
}
