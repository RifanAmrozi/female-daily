//
//  ModalRedeemTicketView.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 24/07/25.
//

import SwiftUI

struct CustomModalView: View {
    @Binding var selectedTab: String
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            // Title
            Text("Tiket berhasil ditukar")
                .font(
                    Font.custom("Montserrat", size: 20)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.PrimarySecondary700)
                .frame(maxWidth: .infinity, alignment: .top)
            // Detail
            Text("Lihat detail event dan mulai petualanganmu!")
                .font(Font.custom("Montserrat", size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.PrimarySecondary700)
                .frame(maxWidth: .infinity, alignment: .top)
            
            HStack(alignment: .center, spacing: 10) {
                Text("Info Acara")
                    .font(
                        Font.custom("Montserrat", size: 15)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.BackgroundColor)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Constants.PrimarySecondary700)
            .cornerRadius(32)
            
            Text("Kembali ke Tiket Saya")
                .font(
                    Font.custom("Montserrat", size: 12)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Constants.GreyscaleGrey600)
                .frame(maxWidth: .infinity, alignment: .top)
                .onTapGesture {
                    onDismiss()
                }
        }
        .padding()
        .background(Constants.BackgroundColor)
        .cornerRadius(16)
        .frame(width: 300)
    }
}
