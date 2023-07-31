//
//  NameView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        Text("Please tell us your name")
        TextField("Enter your name", text: $state.name)
        NavigationLink(destination: ConnectivityView()) {
            Text("Next")
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
