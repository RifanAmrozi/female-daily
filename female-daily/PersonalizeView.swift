//
//  PersonalizeView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 24/07/25.
//

import SwiftUI

struct PersonalizeView: View {
    @State private var selectedCategories: Set<String> = []
    @State private var navigateToMission = false
    
    let categories: [(image: String, caption: String)] = [
        ("haircare", "Hair Care"),
        ("makeup", "Make Up"),
        ("skincare", "Skin Care"),
        ("fragrance", "Fragrance"),
        ("beautytools", "Beauty Tools"),
        ("men", "Men's Grooming"),
        ("nail", "Nail Care"),
        ("suplement", "Suplement")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Yuk Desain petualangan kamu hari ini, mau kemana hari ini?")
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
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 24),
                        GridItem(.flexible(), spacing: 24)
                    ], spacing: 24) {
                        ForEach(categories, id: \.caption) { item in
                            PersonalizeCard(
                                image: item.image,
                                caption: item.caption,
                                isSelected: selectedCategories.contains(item.caption),
                                onTap: {
                                    if selectedCategories.contains(item.caption) {
                                        selectedCategories.remove(item.caption)
                                    } else {
                                        selectedCategories.insert(item.caption)
                                    }
                                }
                            )
                        }
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
                    Button(action: {
                        navigateToMission = true
                    }) {
                        Text("Skip")
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.GreyscaleGrey500)
                    }
                }
            }
            
            Button(action: {
                print("Selected Categories: \(selectedCategories)")
                navigateToMission = true
                //simpen backend disini
                
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
                    .opacity(selectedCategories.isEmpty ? 0.7 : 1.0)
            }
            .disabled(selectedCategories.isEmpty)
            .navigationDestination(isPresented: $navigateToMission) {
                MainTabView()
            }
        }
    }
}

#Preview {
    PersonalizeView()
}
