//
//  ConnectView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 02.08.23.
//

import SwiftUI

struct ConnectView: View {

    @EnvironmentObject var state: AppState
    @State private var showingAlert = false
    @State private var isShowingScanner = false

    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            HStack(alignment: .center) {
                Spacer()
                ScannerViewControllerContainer()
                    .border(Color.red)
                Spacer()
            }
        }
    }
}

struct ConnectView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectView()
    }
}
