//
//  PersonalizeView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 24/07/25.
//

import SwiftUI

struct PersonalizeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Yuk Desain perjalanan kamu hari ini, mau kemana hari ini?")
                          .font(
                            Font.custom("Montserrat", size: 28)
                              .weight(.bold)
                          )
                          .foregroundColor(Constants.PrimaryAccentPrimary700)
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("Dapat lebih dari 1")
                          .font(
                            Font.custom("Montserrat", size: 15)
                              .weight(.medium)
                          )
                          .foregroundColor(Constants.GreyscaleGrey600)
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Spacer(minLength: 24)
                    
                    personalizeCard
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .navigationTitle("Personalisasi")
            .navigationBarTitleDisplayMode(.inline) // Supaya judul di tengah
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.backward")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Skip")
                        .font(
                        Font.custom("Montserrat", size: 15)
                        .weight(.bold)
                        )
                        .foregroundColor(Constants.GreyscaleGrey500)
                }
            }
        }
    }
    
    var personalizeCard: some View {
        ZStack {
            Image("bgcardpers")
              .frame(width: 160, height: 160)
        }
        .frame(width: 160, height: 160)
    }
}

#Preview {
    PersonalizeView()
}
