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
    @State private var shouldContinue = false

    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                if state.role == .fitting {
                    //Host
                    NavigationLink(
                        destination: FittingARView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $shouldContinue) { EmptyView() }
                    if state.partnerName.isEmpty {
                        Text("Scan the QR Code on your partners device")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.top, 100)
                        Spacer()
                        ScannerViewControllerContainer()
                            .padding(.leading, 40)
                        Spacer()
                    } else {
                        Spacer()
                        Text("Your partner is \($state.partnerName.wrappedValue)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .onAppear {
                                state.sessionManager?.startSession()
                            }
                        Spacer()
                    }
                } else {
                    //Guest
                    NavigationLink(
                        destination: ComponentView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $shouldContinue) { EmptyView() }
                    if !state.sessionConnected {
                        Spacer()
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
                        Spacer()
                    } else {
                        Spacer()
                        Text("Session connected. Second Player is: \($state.partnerName.wrappedValue)")
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                ContinueButton {
                    shouldContinue = true
                }
                .disabled(!state.sessionConnected)
                .padding(30)
                //TODO: Disabled style
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
