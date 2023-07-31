//
//  ContentView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    @StateObject var state = State()

    var body: some View {
        HStack {
            Spacer(minLength: 10)
            VStack {
                Spacer(minLength: 200)
                StartGameButton(
                    text: "Start Session"
                ) {
                }
                SelectRoleButton(
                    text: "Fitting Specialist"
                ) {
                }
                SelectRoleButton(
                    text: "Checklist Navigator"
                ) {
                }
                ContinueButton(
                    text: "Continue"
                ) {
                }
            }
            Spacer(minLength: 10)
        }
        NavigationView {
            VStack {
                // edgesIgnoringSafeAre(.all)
                NavigationLink(destination: StaticARViewContainer()) {
                    Text("Open StaticARViewContainer")
                }
                Spacer()
                NavigationLink(destination: ViewProvider.nextView(current: .menu)) {
                    Text("Open BodyTrackedARViewContainer")
                        .background(R.color.testColor.color)
                }
            }
        }
        .environmentObject(state)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
