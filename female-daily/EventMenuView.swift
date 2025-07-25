//
//  EventMenuView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 22/07/25.
//

import SwiftUI

struct EventMenuView: View {
    @State private var selectedTab: String = "pesantiket"
    @Namespace private var underlineAnimation
    var title: String {
        switch selectedTab {
        case "tiketsaya":
            return "Tiket Saya"
        case "tiketqr":
            return "Tiket QR"
        default:
            return "Pesan Tiket"
        }
    }
    
    var body: some View {
        VStack(spacing:0) {
            HStack(alignment: .center) {
                // Space Between
                Image(systemName: "arrow.left")
                Spacer()
                // Alternative Views and Spacers
                Text(title)
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.GreyscaleGrey950)
                    .frame(width: 121, alignment: .top)
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
            .background(Constants.BackgroundColor)
            
            VStack {
                HStack(spacing: 0) {
                    Button(action: {
                        selectedTab = "pesantiket"
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Image(systemName: "cart")
                                .frame(width: 24, height: 19)
                                .foregroundColor(selectedTab == "pesantiket" ? Constants.PrimaryAccentPrimary600 : Constants.GreyscaleGrey950)
                            Text("Pesan Tiket")
                                .font(
                                    Font.custom("Montserrat", size: 15)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(selectedTab == "pesantiket" ? Constants.PrimaryAccentPrimary600 : Constants.GreyscaleGrey950)
                                .frame(width: 89, alignment: .top)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, minHeight: 48, alignment: .center)
                    }
                    
                    Button(action: {
                        selectedTab = "tiketsaya"
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Image(systemName: "ticket")
                                .frame(width: 24, height: 19)
                                .foregroundColor(selectedTab == "tiketsaya" ? Constants.PrimaryAccentPrimary600 : Constants.GreyscaleGrey950)
                            Text("Tiket Saya")
                                .font(Font.custom("Montserrat", size: 15))
                                .multilineTextAlignment(.center)
                                .foregroundColor(selectedTab == "tiketsaya" ? Constants.PrimaryAccentPrimary600 : Constants.GreyscaleGrey950)
                                .frame(width: 75, alignment: .top)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, minHeight: 48, alignment: .center)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                
                HStack {
                    if selectedTab == "tiketsaya" {
                        Spacer()
                    }
                    Rectangle()
                        .fill(Constants.PrimaryAccentPrimary600)
                        .frame(width: 196.5, height: 2)
                        .matchedGeometryEffect(id: "underline", in: underlineAnimation)
                    if selectedTab == "pesantiket" {
                        Spacer()
                    }
                }
                .animation(.easeInOut(duration: 0.25), value: selectedTab)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    if selectedTab == "pesantiket" {
                        PesanTiketCardView(eventname: "Jakarta X Beauty 2025", eventdate: "01 - 03 Agustus 2025", eventlocation: "Jakarta Convention Center", eventprice: "Rp. 10.000")
                        PesanTiketCardView(eventname: "Surabaya X Beauty 2025", eventdate: "01 - 03 Desember 2025", eventlocation: "Surabaya Convention Center", eventprice: "Rp. 7.000")
                        PesanTiketCardView(eventname: "Bandung X Beauty 2025", eventdate: "05 - 07 Desember 2025", eventlocation: "Bandung Convention Center", eventprice: "Rp. 20.000")
                    } else if selectedTab == "tiketsaya" {
                        let models = TiketModel.getDummyData()

                        ForEach(Array(models.enumerated()), id: \.element.id) { index, tiket in
                            TiketSayaView(data: tiket, row: index + 1, selectedTab: $selectedTab)
                        }
                    } else if selectedTab == "tiketqr" {
                        QRCodeView(qrString: "A1BJXB281", selectedTab: $selectedTab)
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity, minHeight: 695)
            }
        }
    }
}

#Preview {
    EventMenuView()
}
