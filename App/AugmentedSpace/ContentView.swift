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
    @State private var isShowingNameView = false

    var body: some View {
            NavigationView {
                VStack {
                    NavigationLink(destination: NameView(), isActive: $isShowingNameView) { EmptyView() }
                    Spacer()
                    SelectRoleButton(textlarge: "Checklist Navigator", textsmall: "osdlfhglhjs") {
                        state.role = .checklist
                        isShowingNameView = true
                    }
                    Spacer()
                    Button("Start as Fitting Specialist") {
                        state.role = .fitting
                        isShowingNameView = true
                    }
                    Spacer()
                    // edgesIgnoringSafeAre(.all)
                    //                NavigationLink(destination: StaticARViewContainer()) {
                    //                    Text("Open StaticARViewContainer")
                    //                }
                    //                NavigationLink(destination: ViewProvider.nextView(current: .menu)) {
                    //                    Text("Open BodyTrackedARViewContainer")
                    //                        .background(R.color.testColor.color)
                    //                }
                    //                NavigationLink(destination: ViewProvider.connectivityView) {
                    //                    Text("Open ConnectivityView")
                    //                }
                    //                NavigationLink(destination: ScannerViewControllerContainer()) {
                    //                    Text("Open Scanner")
                    //                }

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
