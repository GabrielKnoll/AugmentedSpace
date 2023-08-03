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
                StartMenuView()
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
