//
//  ContentView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // edgesIgnoringSafeAre(.all)
                NavigationLink(destination: StaticARViewContainer()) {
                    Text("Open StaticARViewContainer")
                }
                Spacer()
                NavigationLink(destination: BodyTrackedARViewContainer()) {
                    Text("Open BodyTrackedARViewContainer")
                        .background(R.color.testColor.color)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
