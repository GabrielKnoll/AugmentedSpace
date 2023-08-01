//
//  SelectRoleView.swift
//  AugmentedSpace
//
//  Created by Tristan Häuser on 01.08.23.
//
import SwiftUI

struct SelectRoleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Welcome to")
                    .font(Font.custom("Poppins-SemiBold", size: 21))
                    .foregroundColor(Color.white)
                    .padding(.top, 100)
                HStack {
                    Text("AR-")
                        .font(Font.custom("Poppins-SemiBold", size: 46))
                        .foregroundColor(Color(red: 0.953, green: 0.262, blue: 0.129))
                    Text("Stronaut")
                        .font(Font.custom("Poppins-SemiBold", size: 46))
                        .foregroundColor(Color.white)
                        .padding(.leading, -8)
                }
                .minimumScaleFactor(0.9)
                Spacer()
                Text("Select your Role:")
                    .font(Font.custom("Poppins-SemiBold", size: 21))
                    .foregroundColor(Color(red: 0.953, green: 0.262, blue: 0.129))
            }
            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))

            SelectRoleButton(textlarge: "Fitting Specialist", textsmall: "Try to assemble the components of the spacesuit correctly") {
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            SelectRoleButton(textlarge: "Checklist Navigator", textsmall: "Give instructions which components are needed") {
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            Spacer(minLength: 30)
        }
        .background(
            Image("spaceBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped(antialiased: true)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct SelectRoleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRoleView()
    }
}
