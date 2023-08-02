//
//  PhotoIntroView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 02.08.23.
//

import SwiftUI

struct PhotoIntroView: View {
    @State private var navLink = false

    var body: some View {
        VStack(alignment: .leading) {
            Spacer(minLength: 100)
            Text("Ready for Takeoff")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
            Text("Capture your personal space experience and take a souvenir photo.")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Text("Make sure that the body is visible")
                    .foregroundColor(.white)
                Spacer()
            }
            TakePhotoButton(text: "TAKE A PHOTO") {
                navLink = true
            }
        }
        .padding(15)
        .background {
            Image(R.image.astronaut_background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped(antialiased: true)
                .blur(radius: 3)
                .brightness(-0.1)
                .edgesIgnoringSafeArea(.all)
        }
        .overlay(alignment: .top) {
            StatusBarView()
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
        }
        NavigationLink(destination: PhotoView().navigationBarBackButtonHidden(true), isActive: $navLink) { EmptyView() }
    }
}

struct PhotoIntroView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoIntroView()
    }
}
