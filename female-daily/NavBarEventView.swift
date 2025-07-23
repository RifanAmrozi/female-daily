//
//  NavBarEventView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 23/07/25.
//

import SwiftUI

struct NavBarEventView: View {
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 358, height: 90.4024)
              .background(Constants.BackgroundColor)
              .cornerRadius(10.04832)
              .shadow(color: Color(red: 0.96, green: 0.44, blue: 0.71).opacity(0.3), radius: 7.5, x: 0, y: 1)
            HStack(spacing: 31) {
                VStack(alignment: .center, spacing: 8) {
                    Image(systemName: "building")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                    // Normal
                    Text("Event")
                        .font(
                            Font.custom("Montserrat", size: 15)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                .padding(0)
                .frame(width: 86, alignment: .top)
                
                VStack(spacing: 4) {
                    ZStack {
                        Image("scanbg")
                            .frame(width: 80, height: 80)
                        Image(systemName: "qrcode")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Constants.PrimaryAccentPrimary50)
                    }
                    
                    // Normal
                    Text("Scan")
                        .font(Font.custom("Montserrat", size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.GreyscaleGrey950)
                        .frame(width: 86, alignment: .top)
                }
                .padding(.bottom,45)
                
                VStack(alignment: .center, spacing: 8) {
                    Image(systemName: "map")
                      .frame(width: 30, height: 30)
                    
                    // Normal
                    Text("Journey")
                      .font(Font.custom("Montserrat", size: 15))
                      .multilineTextAlignment(.center)
                      .foregroundColor(Constants.GreyscaleGrey950)
                      .frame(maxWidth: .infinity, alignment: .top)
                }
                    .padding(0)
                    .frame(width: 86, alignment: .top)
            }
        }
        .frame(width: 358, height: 117.98663)
    }
}

#Preview {
    NavBarEventView()
        .padding()
        .background(Color.black.opacity(0.2))
}
