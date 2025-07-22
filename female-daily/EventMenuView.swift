//
//  EventMenuView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 22/07/25.
//

import SwiftUI

struct EventMenuView: View {
    @State private var selectedTab: String = "pesantiket"
    
    var body: some View {
        VStack(spacing:0) {
            HStack(alignment: .center) {
                // Space Between
                Image(systemName: "arrow.left")
                Spacer()
                // Alternative Views and Spacers
                Text("Pesan Tiket")
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.GreyscaleGrey950)
                    .frame(width: 121, alignment: .top)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
            .background(Constants.BackgroundColor)
            
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
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if selectedTab == "pesantiket" {
                        pesantiketcardview()
                        pesantiketcardview()
                        pesantiketcardview()
                    } else if selectedTab == "tiketsaya" {
                        Text("Belum ada tiket") // Ganti dengan tampilan tiketmu
                            .padding()
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity, minHeight: 695, alignment: .topLeading)
            }
        }
    }
}

#Preview {
    EventMenuView()
}
