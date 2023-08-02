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
        ZStack {
            Image("spaceBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                if state.role == .fitting {
                    //Host
                    if state.partnerName.isEmpty {
                        Text("Scan the QR Code on your partners device")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.top, 100)
                        Spacer(minLength: 150)
                        ScannerViewControllerContainer()
                            .padding(.leading, 40)
                        Spacer()
                    } else {
                        Text("Your partner is \($state.partnerName.wrappedValue)")
                            .onAppear {
                                state.sessionManager?.startSession()
                            }
                    }
                } else {
                    //Guest
                    Text("Show this QR-Code to your second player")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Image(uiImage: QRUtility.generateQRCode(from: state.name))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            state.sessionManager?.joinSession()
                        }
                }
                ContinueButton {
                    print("Hello")
                }
                .padding(30)
            }
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showingAlert = true
                }
            }
        }
    }
}

struct ConnectivityView_Previews: PreviewProvider {

    static let state = AppState()

    static var previews: some View {
        ConnectivityView()
            .environmentObject(AppState())
    }
}
