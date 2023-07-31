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
