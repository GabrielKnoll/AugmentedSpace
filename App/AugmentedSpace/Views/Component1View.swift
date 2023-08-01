//
//  Component1View.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

struct Components {
    let component1: String
    let component2: String
    let component3: String
    let component4: String
    let component5: String
    
    func getText(for appState: AppState) -> String {
        switch appState.step {
            case .Step1:
                return component1
            case .step2:
                return component2
            case .step3:
                return component3
            case .step4:
                return component4
            case .step5:
                return component5
            }
        }

struct Component1View: View {

    @StateObject var state = AppState()

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

            }
        }
    }
}

struct Component1View_Previews: PreviewProvider {
    static var previews: some View {
        Component1View()
    }
}
