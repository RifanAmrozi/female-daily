//
//  MissionDetailView.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 28/07/25.
//

import SwiftUI

struct MissionDetailView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Mission 1")
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, 16)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 262)
                .background(
                    Image("mission-kahf")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                )
                .padding(0)
                .padding(.bottom, 8)
            
            HStack {
                Text("Pergi ke Booth:")
                    .font(
                        Font.custom("Montserrat", size: 15)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.GreyscaleGrey900)
                
                // Title
                Text("Kahf")
                    .font(
                        Font.custom("Montserrat", size: 28)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.PrimaryAccentPrimary600)
                Spacer()
            }
            .padding(.leading, 24)
            
            NavigationLink(destination: PetaView()) {
                HStack(alignment: .center) {
                    // Space Between
                    Text("Peta JxB 2025")
                        .font(
                            Font.custom("Montserrat", size: 15)
                                .weight(.semibold)
                        )
                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                    Spacer()
                    // Alternative Views and Spacers
                    Image("Vector")
                        .resizable()
                        .frame(width: 11, height: 11)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Constants.BackgroundColor)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(Constants.PrimaryAccentPrimary700, lineWidth: 1)
                )
                .padding(.leading, 24)
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
            
            HStack {
                // Title 2
                Text("Tantangan")
                  .font(
                    Font.custom("Montserrat", size: 20)
                      .weight(.bold)
                  )
                  .foregroundColor(Constants.PrimaryAccentPrimary800)
                  .padding(.leading, 24)
                Spacer()
            }
            
            HStack {
                Image("line-tantangan")
                    .resizable()
                  .frame(width: 47, height: 123)
                
                VStack(alignment: .leading) {
                    // Normal
                    Text("1. Follow Instagram @kahfindonesia")
                      .font(Font.custom("Montserrat", size: 15))
                      .foregroundColor(.black)
                      .padding(.bottom, 16)
                    // Normal
                    Text("2. Post Insta story dan tag @kahfindonesia dan tag 5 temanmu")
                      .font(Font.custom("Montserrat", size: 15))
                      .foregroundColor(.black)
                      .padding(.bottom, 16)
                    // Normal
                    Text("3. Tunjukkan kepada booth setelah selesai dan scan QR Missionnya")
                      .font(Font.custom("Montserrat", size: 15))
                      .foregroundColor(.black)
                    
                }
                .padding(.trailing, 24)
            }
            .padding(.leading, 24)
            
            NavigationLink(destination: ScanQRView()) {
                HStack(alignment: .center) {
                    Image("qr-mission")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(Constants.PrimaryAccentPrimary50)
                }
                .padding(15)
                .frame(width: 93, height: 93, alignment: .center)
                .background(Constants.PrimaryAccentPrimary200)
                .cornerRadius(100)
            }
        }
    }
}

#Preview {
    MissionDetailView()
}
