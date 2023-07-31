//
//  ConnectivityView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct ConnectivityView: View {
    @EnvironmentObject var state: AppState
    @State private var showingAlert = false
    @State private var isShowingScanner = false

    var body: some View {
        VStack {
            if state.role == .checklist {
                //Guest
                Text("Scan QR Code")
                if state.partnerName.isEmpty {
                    ScannerViewControllerContainer()
                } else {
                    Text("Your partner is \($state.partnerName.wrappedValue)")
                }
            } else {
                //Host
                Text("Show this QR-Code to your second player")
                    .font(.title)
                Image(uiImage: QRUtility.generateQRCode(from: state.name))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showingAlert = true
            }
        }
    }
}

struct ConnectivityView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectivityView()
    }
}
