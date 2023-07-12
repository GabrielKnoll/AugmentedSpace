//
//  ContentView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 12.07.23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                //edgesIgnoringSafeAre(.all)
                NavigationLink(destination: StaticARViewContainer()) {
                    Text("Open StaticARViewContainer")
                }
                NavigationLink(destination: BodyTrackedARViewContainer()) {
                    Text("Open BodyTrackedARViewContainer")
                }
            }
        }
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
