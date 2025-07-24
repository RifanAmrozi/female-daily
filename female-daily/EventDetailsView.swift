//
//  EventDetailsView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 23/07/25.
//

import SwiftUI

struct EventDetailsView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing:20){
                    
                    //                    HStack(alignment: .center) {
                    //                        // Space Between
                    //                        Image(systemName: "house")
                    //                        Spacer()
                    //                        // Alternative Views and Spacers
                    //                        Text("Event Detail")
                    //                            .font(
                    //                                Font.custom("Monserrat", size: 20)
                    //                                    .weight(.semibold)
                    //                            )
                    //                            .multilineTextAlignment(.center)
                    //                            .foregroundColor(Constants.GreyscaleGrey950)
                    //                            .frame(maxWidth: .infinity, alignment: .top)
                    //                    }
                    //                    .padding(.horizontal, 24)
                    //                    .padding(.vertical, 16)
                    //                    .frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
                    //                    .background(Constants.BackgroundColor)
                    
                    //                    VStack(spacing: 50) {
                    //banner
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, minHeight: 115)
                        .background(
                            Image("eventdetail")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        )
                    
                    //peta jxb
                    VStack {
                        HStack(alignment: .center, spacing: 16) {
                            Image("Group 53")
                                .frame(width: 120, height: 120)
                            
                            VStack(alignment: .leading, spacing: 32) {
                                VStack(spacing: 4) {
                                    Text("Cari booth?")
                                        .font(
                                            Font.custom("Montserrat", size: 20)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.PrimaryAccentPrimary800)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top, 8)
                                    Text("Klik peta biar nggak nyasar!")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                NavigationLink(destination: PetaView())
                                                {
                                    HStack(alignment: .center) {
                                        // Space Between
                                        Text("Peta JxB 2025")
                                            .font(
                                                Font.custom("Montserrat", size: 15)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(Constants.PrimaryAccentPrimary700)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                        Spacer()
                                        // Alternative Views and Spacers
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .font(Font.system(size: 12).weight(.bold))
                                            .frame(width: 6.58489, height: 11.16578)
                                            .foregroundColor(Constants.PrimaryAccentPrimary700)
                                    }
                                    .padding(8)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .background(Constants.BackgroundColor)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 0.5)
                                            .stroke(Constants.PrimaryAccentPrimary700, lineWidth: 1)
                                    )
                                }
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Constants.BackgroundColor)
                        .cornerRadius(8)
                        .shadow(color: Color(red: 0.43, green: 0.43, blue: 0.43).opacity(0.2), radius: 7.5, x: 0, y: 1)
                    }
                    .padding(.horizontal, 24)
                    
                    
                    //flash sale
                    VStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center) {
                            // Space Between
                            Text("Flash Sale")
                                .font(
                                    Font.custom("Montserrat", size: 28)
                                        .weight(.bold)
                                )
                                .foregroundColor(Constants.PrimaryAccentPrimary800)
                            Spacer()
                            // Alternative Views and Spacers
                            HStack(alignment: .center, spacing: 4) {
                                Text("Lihat Semua")
                                    .font(
                                        Font.custom("Montserrat", size: 12)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Constants.PrimaryAccentPrimary700)
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .font(Font.system(size: 12).weight(.bold))
                                    .frame(width: 4, height: 6)
                                    .foregroundColor(Constants.PrimaryAccentPrimary700)
                            }
                            .padding(0)
                        }
                        .padding(0)
                        .frame(width: 345, alignment: .center)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center, spacing: 16) {
                                FlashSaleCardView(flashsaleimage: "mykonos", flashsalename: "MYKONOS", flashsaletime: "Pukul 11:00")
                                FlashSaleCardView(flashsaleimage: "cruisita", flashsalename: "CRUISITA", flashsaletime: "Pukul 12:00")
                                FlashSaleCardView(flashsaleimage: "skintific", flashsalename: "SKINTIFIC", flashsaletime: "Pukul 13:00")
                                FlashSaleCardView(flashsaleimage: "skintific", flashsalename: "SKINTIFIC", flashsaletime: "Pukul 13:00")
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .top)
                    //                    }
                }
            }
            .navigationTitle("Event Detail")
            .navigationBarTitleDisplayMode(.inline) // Supaya judul di tengah
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "house")
                        .foregroundColor(.black)
                }
            }
            customTabbar
        }
    }
    
    var customTabbar: some View {
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
                
                NavigationLink(destination: ScanQRView())
                {
                    VStack(alignment: .center, spacing: 4) {
                        ZStack{
                            Image("scanbg")
                                .frame(width: 80, height: 80)
                            Image(systemName: "qrcode")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Constants.PrimaryAccentPrimary50)
                        }
                        Text("Scan")
                            .font(Font.custom("Montserrat", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Constants.GreyscaleGrey950)
                            .frame(width: 86, alignment: .top)
                    }
                }
                .padding(.bottom,45)
                
                NavigationLink(destination: MissionView())
                {
                    VStack(alignment: .center, spacing: 8) {
                        Image(systemName: "map")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Constants.GreyscaleGrey950)
                        Text("Mission")
                            .font(Font.custom("Montserrat", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Constants.GreyscaleGrey950)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(0)
                    .frame(width: 86, alignment: .top)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 117.98663)
    }
}

#Preview {
    EventDetailsView()
}
