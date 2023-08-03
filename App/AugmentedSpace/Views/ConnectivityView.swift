//
//  ConnectivityView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 31.07.23.
//

import SwiftUI

struct ConnectivityView: View {
    @EnvironmentObject var state: AppState
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    @State private var isShowingScanner = false
    @State private var shouldContinue = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .center) {
                if state.role == .fitting {
                    //Host
                    NavigationLink(
                        destination: FittingARView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $shouldContinue) { EmptyView() }
                    if state.partnerName.isEmpty {
                        Text("Scan the QR Code on your partners device")
                            .font(Font.custom("Poppins-SemiBold", size: 30))
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                        Spacer()
                        ScannerViewControllerContainer()
                        Spacer()
                    } else {
                        SessionStateView()
                            .padding(.leading, 20)
                    }
                } else {
                    //Guest
                    NavigationLink(
                        destination: ComponentView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $shouldContinue) { EmptyView() }
                    if !state.sessionConnected {
                        ShowQRCodeView()
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    } else {
                        Text("Session connected.\nSecond player is \($state.partnerName.wrappedValue).")
                            .font(Font.custom("Poppins-SemiBold", size: 30))
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                HStack {
                    BackButton {
                        dismiss()
                    }
                    .frame(maxWidth: 120)
                    .padding(.leading, 20)
                    ContinueButton {
                        shouldContinue = true
                    }
                    .disabled(!state.sessionConnected)
                    .padding(.trailing, 20)
                }
            }
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
        let state = AppState()
        ConnectivityView()
            .environmentObject(state)
            .onAppear {
                state.role = .fitting
                state.sessionConnected = false
                state.partnerName = ""
            }
    }
}
