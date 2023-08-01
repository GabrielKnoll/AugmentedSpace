//
//  StartMenuView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 31.07.23.
//

import SwiftUI

struct StartMenuView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Image("spaceBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(maxHeight: 75)
                    Text("Welcome to")
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                        .foregroundColor(Color.white)
                    HStack {
                        Text("AR-")
                            .font(Font.custom("Poppins-SemiBold", size: 47))
                            .foregroundColor(Color(red: 0.953, green: 0.262, blue: 0.129))
                        Text("Stronaut")
                            .foregroundColor(Color.white)
                    }
                    .font(.system(size: 48))
                    Spacer()
                    Text("This is a two player game.")
                        .foregroundColor(Color(red: 0.953, green: 0.262, blue: 0.129))
                    Text("Find a teammate and select your side")
                        .foregroundColor(Color.white)
                }
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                Spacer(minLength: 100)
                StartGameButton(text: "Start Game") {
                }
                .padding(5.0)
            }
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
