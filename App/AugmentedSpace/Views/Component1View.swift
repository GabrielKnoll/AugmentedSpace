//
//  Component1View.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//

import SwiftUI

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
