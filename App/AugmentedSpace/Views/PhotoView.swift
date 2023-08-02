//
//  PhotoView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 02.08.23.
//

import SwiftUI

struct PhotoView: View {
    @State private var secondPage = false

    var body: some View {
        ZStack {
            BodyTrackedARViewContainer()
                .ignoresSafeArea(.all)
            if !secondPage {
                VStack {
                    Spacer(minLength: 75)
                    FinderView()
                    Spacer(minLength: 75)
                }
            }
        }
        .overlay(alignment: .top) {
            StatusBarView()
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
        }
        .overlay(alignment: .bottom) {
            ZStack {
                TakePhotoIconButton {
                    print("smile")
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
            }
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.75))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
