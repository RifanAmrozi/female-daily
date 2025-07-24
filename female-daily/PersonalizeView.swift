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
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 24),
                        GridItem(.flexible(), spacing: 24)
                    ], spacing: 24) {
                        PersonalizeCard(image: "haircare", caption: "Hair Care")
                        PersonalizeCard(image: "makeup", caption: "Make Up")
                        PersonalizeCard(image: "skincare", caption: "Skin Care")
                        PersonalizeCard(image: "fragrance", caption: "Fragrance")
                        PersonalizeCard(image: "beautytools", caption: "Beauty Tools")
                        PersonalizeCard(image: "men", caption: "Men's Grooming")
                        PersonalizeCard(image: "nail", caption: "Nail Care")
                        PersonalizeCard(image: "suplement", caption: "Suplement")
                    }

                }
                .padding(24)
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
            
            Button(action: {
                    print("submit tapped")
                }) {
                Text("Submit")
                    .font(
                        Font.custom("Montserrat", size: 15)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 16)
                    .frame(width: 345)
                    .background(Constants.PrimarySecondary700)
                    .cornerRadius(32)
            }
        }
    }
}

#Preview {
    PersonalizeView()
}
