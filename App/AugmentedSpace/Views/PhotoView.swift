//
//  PhotoView.swift
//  AugmentedSpace
//
//  Created by Gabriel Knoll on 02.08.23.
//

import SwiftUI

struct PhotoView: View {
    @EnvironmentObject var state: AppState
    @State private var secondPage = false
    @State private var hideUI = false
    @State private var finish = false
    @State private var resultImage = Image(systemName: "camera.fill")
    @State private var currentImage: UIImage?
    @State private var helmet = false
    @State private var itemToDisplay = Item.helmet

    var body: some View {
        ZStack {
            if !secondPage {
                BodyTrackedARViewContainer()
                    .ignoresSafeArea(.all)
                    .onAppear {
                        state.selectedItemToDisplay!(.coolingGarment)
                    }
                VStack {
                    Spacer(minLength: 75)
                    FinderView()
                    Spacer(minLength: 75)
                }
                .isHidden(hideUI)
            } else {
                VStack {
                    resultImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                }
            }
        }
        .overlay(alignment: .top) {
            if !secondPage {
                StatusBarView()
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
                    .isHidden(hideUI)
            }
        }
        .overlay(alignment: .bottom) {
            ZStack {
                if !secondPage {
                    HStack {
                        TakePhotoIconButton {
                            takePhoto()
                        }
                        HelmetButton {
                            if helmet {
                                helmet = false
                                itemToDisplay = .gloves
                                state.selectedItemToDisplay!(itemToDisplay)
                                print("Helmet is ", helmet)
                            } else {
                                helmet = true
                                itemToDisplay = .helmet
                                state.selectedItemToDisplay!(itemToDisplay)
                                print("Helmet is ", helmet)
                            }
                        }
                    }
                    .isHidden(hideUI)
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                } else {
                    HStack {
                        RepeatButton {
                            secondPage = false
                        }
                        SaveButton {
                            saveImage()
                            finish = true
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 40, trailing: 15))
                }
            }
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.75))
            .isHidden(hideUI)
        }
        NavigationLink(destination: EndSessionView().navigationBarBackButtonHidden(true), isActive: $finish) { EmptyView() }
    }

    private func takePhoto() {
        hideUI = true
        state.machFoto! {
            image in
            currentImage = image
            resultImage = Image(uiImage: image)
            secondPage = true
            hideUI = false
        }
    }

    private func saveImage() {
        guard let image = currentImage else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

    }
}

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
