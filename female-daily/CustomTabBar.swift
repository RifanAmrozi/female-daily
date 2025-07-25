//
//  CustomTabBar.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 25/07/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: MainTabView.Tab

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 358, height: 90.4)
                .background(Constants.BackgroundColor)
                .cornerRadius(10)
                .shadow(color: Color(red: 0.96, green: 0.44, blue: 0.71).opacity(0.3), radius: 7.5, x: 0, y: 1)

            HStack(spacing: 31) {
                Button {
                    selectedTab = .mission
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "map")
                            .frame(width: 30, height: 30)
                            .foregroundColor(selectedTab == .mission ? Constants.PrimaryAccentPrimary700 : Constants.GreyscaleGrey950)
                        Text("Mission")
                            .font(selectedTab == .mission ? .custom("Montserrat", size: 15).weight(.bold) : .custom("Montserrat", size: 15))
                            .foregroundColor(selectedTab == .mission ? Constants.PrimaryAccentPrimary700 : Constants.GreyscaleGrey950)
                    }
                    .frame(width: 86)
                }

                NavigationLink(destination: ScanQRView()) {
                    VStack(spacing: 4) {
                        ZStack {
                            Image("scanbg")
                                .frame(width: 80, height: 80)
                            Image(systemName: "qrcode")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Constants.PrimaryAccentPrimary50)
                        }
                        Text("QR Info")
                            .font(.custom("Montserrat", size: 15))
                            .foregroundColor(Constants.GreyscaleGrey950)
                    }
                    .frame(width: 86)
                }
                .padding(.bottom, 45)
                
                Button {
                    selectedTab = .event
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "building")
                            .frame(width: 30, height: 30)
                            .foregroundColor(selectedTab == .event ? Constants.PrimaryAccentPrimary700 : Constants.GreyscaleGrey950)
                        Text("Event")
                            .font(selectedTab == .event ? .custom("Montserrat", size: 15).weight(.bold) : .custom("Montserrat", size: 15))
                            .font(.custom("Montserrat", size: 15).weight(.bold))
                            .foregroundColor(selectedTab == .event ? Constants.PrimaryAccentPrimary700 : Constants.GreyscaleGrey950)
                    }
                    .frame(width: 86)
                }
            }
        }
        .frame(height: 117)
    }
}
