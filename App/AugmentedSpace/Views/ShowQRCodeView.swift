//
//  ShowQRCodeView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 03.08.23.
//

import SwiftUI

struct ShowQRCodeView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        VStack {
            Spacer()
            Text("Show this QR-Code to your second player")
                .font(Font.custom("Poppins-SemiBold", size: 30))
                .foregroundColor(Color.white)
            Image(uiImage: QRUtility.generateQRCode(from: state.name))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .onAppear {
                    state.sessionManager?.joinSession()
                }
            Spacer()
        }
    }
}

struct ShowQRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ShowQRCodeView()
            .environmentObject(AppState())
            .background(.black)
    }
}
