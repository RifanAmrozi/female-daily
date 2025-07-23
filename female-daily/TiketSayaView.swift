//
//  TiketSayaView.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 22/07/25.
//

import SwiftUI

struct TiketSayaView: View {
    var data: TiketModel
    var row: Int
    @Binding var selectedTab: String

    var body: some View {
        VStack {
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .foregroundColor(Constants.PrimaryAccentPrimary50)
                            .frame(width: 48, height: 48)
                        
                        Text("#\(String(format: "%02d", row))")
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Constants.PrimaryAccentPrimary800)
                    }
                    .padding(.trailing, 8)
                    
                    VStack(alignment: .leading) {
                        Text("Berlaku hingga: \(data.expiredAt)")
                            .font(
                                Font.custom("Montserrat", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(Constants.GreyscaleGrey800)
                            .padding(.bottom, 8)
                        
                        Text(data.eventName)
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.PrimarySecondary800)
                        
                    }
                }
                .padding(.bottom, 16)
                .padding(.leading, -16)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("ID Tiket")
                            .font(
                                Font.custom("Inter", size: 14)
                                    .weight(.light)
                            )
                            .foregroundColor(Constants.GreyscaleGrey950)
                        
                        Text(data.id)
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.GreyscaleGrey950)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Status")
                            .font(
                                Font.custom("Inter", size: 14)
                                    .weight(.light)
                            )
                            .foregroundColor(Constants.GreyscaleGrey950)
                        
                        Text(data.status)
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.GreyscaleGrey950)
                    }
                }
                .padding(.bottom, 8)
                
                if data.status == "Belum ditukar" {
                    HStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .padding(.leading, -40)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0.5, green: 0.53, blue: 0.56).opacity(0.2), radius: 10, x: 0, y: 1)
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 1)
                            .overlay(
                                Rectangle()
                                    .stroke(Constants.PrimarySecondary500,style: StrokeStyle(lineWidth: 1, dash: [5]))
                                    .foregroundColor(.gray)
                            )
                            .padding(.bottom, 8)
                        Circle()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, -40)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0.5, green: 0.53, blue: 0.56).opacity(0.2), radius: 10, x: 0, y: 1)
                    }
                    
                    SlideUnlockView(selectedTab: $selectedTab)
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 16)
            .padding(.leading, 24)
            .padding(.trailing, 24)
        }
        .background(Constants.BackgroundColor)
        .cornerRadius(16)
        .shadow(color: Color(red: 0.5, green: 0.53, blue: 0.56).opacity(0.2), radius: 10, x: 0, y: 1)
    }
    
}

#Preview {
    TiketSayaView(data: .getDummyData()[0], row: 1, selectedTab: Binding.constant("tiketsaya"))
}
