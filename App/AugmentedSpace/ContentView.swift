//
//  ContentView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    @StateObject var state = AppState()

    var body: some View {
        NavigationView {
            VStack {
                // edgesIgnoringSafeAre(.all)
                NavigationLink(destination: StaticARViewContainer()) {
                    Text("Open StaticARViewContainer")
                }
                NavigationLink(destination: ViewProvider.nextView(current: .menu)) {
                    Text("Open BodyTrackedARViewContainer")
                        .background(R.color.testColor.color)
                }
                NavigationLink(destination: ViewProvider.connectivityView) {
                    Text("Open ConnectivityView")
                }
                NavigationLink(destination: ScannerViewControllerContainer()) {
                    Text("Open Scanner")
                }
            }
        }
        .environmentObject(state)
        .onAppear(perform: { state.sessionManager.initSession(state: state) })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
