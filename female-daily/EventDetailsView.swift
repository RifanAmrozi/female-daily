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
                                        Image("Vector")
                                            .frame(width: 6.58489, height: 11.16578)
                                            .background(Constants.PrimaryAccentPrimary700)
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
                                    .foregroundColor(Constants.GreyscaleGrey950)
                                Spacer()
                                // Alternative Views and Spacers
                                HStack(alignment: .center, spacing: 4) {
                                    Text("Lihat Semua")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                                    Image("Vector")
                                        .frame(width: 4, height: 6)
                                        .background(Constants.PrimaryAccentPrimary700)
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
            
            //navbar
            ZStack {
                NavBarEventView()
            }
            .frame(width: 358, height: 117.98663)
        }
    }
}

#Preview {
    EventDetailsView()
}
