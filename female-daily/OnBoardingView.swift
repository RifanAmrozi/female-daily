//
//  OnBoardingView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 25/07/25.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var currentStep = 1
    private let totalSteps = 3
    
    var body: some View {
        VStack(spacing: 0) {
            // Header dengan close button dan progress indicator
            HStack(alignment: .center, spacing: 36) {
                Button(action: {
                    // Action untuk close
                }) {
                    Image(systemName: "xmark")
                        .frame(width: 24, height: 24)
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                ForEach(1...totalSteps, id: \.self) { step in
                    Rectangle()
                        .fill(step <= currentStep ? Color.pink : Color.pink.opacity(0.3))
                        .frame(width: 65, height: 4)
                        .animation(.easeInOut(duration: 0.3), value: currentStep)
                }
            }
            .frame(width: 313, height: 39, alignment: .center)
            .padding(.bottom, 25)
            
            // Content berdasarkan step
            
            VStack(spacing: 30) {
                
                VStack(alignment: .center, spacing: 8) {
                    // Caption
                    Text("Langkah \(currentStep)")
                        .font(Font.custom("Montserrat", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    // Title
                    Text(getTitleForStep())
                        .font(
                            Font.custom("Montserrat", size: 20)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Constants.PrimaryAccentPrimary600)
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                //                .padding(.bottom, 16)
                .frame(width: 297, alignment: .top)
                
                if currentStep == 1 {
                    VStack(spacing:16) {
                        // Image
                        Image("onboarding1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        // Description
                        Text("Kamu bisa datang ke 400+ booth brand yang kamu inginkan di Jakarta X Beauty 2025")
                            .font(Font.custom("Montserrat", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 299, alignment: .top)
                    }
                    .frame(width: 299, height: 445)
                    
                } else if currentStep == 2 {
                    VStack(spacing: 16) {
                        // Image
                        Image("onboarding2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 230, height: 227)
                        
                        HStack(alignment: .center, spacing: 8) {
                            Image ("tanya")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Tanyakan ke penjaga booth")
                                    .font(
                                        Font.custom("Montserrat", size: 15)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                
                                Text("Bertanya ke penjaga booth mengenai kode QR informasi")
                                    .font(Font.custom("Montserrat", size: 12))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(width: 227, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack(alignment: .center, spacing: 8) {
                            Image ("kamera")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Kamera fokus dan stabil")
                                    .font(
                                        Font.custom("Montserrat", size: 15)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                
                                Text("astikan kamera fokus dan stabil agar kode QR terbaca oleh sistem")
                                    .font(Font.custom("Montserrat", size: 12))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(width: 227, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(width: 299, height: 445, alignment: .topLeading)
                    
                } else {
                    VStack(alignment: .leading, spacing: 24) {
                        HStack(alignment: .center, spacing: 16) {
                            Image("brand")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            // Normal
                            Text("Informasi mengenai brand")
                              .font(Font.custom("Montserrat", size: 15))
                              .foregroundColor(.black)
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .center, spacing: 16) {
                            Image("produk")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            // Normal
                            Text("List produk dan harga")
                              .font(Font.custom("Montserrat", size: 15))
                              .foregroundColor(.black)
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .center, spacing: 16) {
                            Image("jam")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            // Normal
                            Text("Jam flash sale")
                              .font(Font.custom("Montserrat", size: 15))
                              .foregroundColor(.black)
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .center, spacing: 16) {
                            Image("freebies")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            // Normal
                            Text("Cara mendapatkan freebies")
                              .font(Font.custom("Montserrat", size: 15))
                              .foregroundColor(.black)
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(alignment: .center, spacing: 16) {
                            Image("event")
                                .frame(width: 65, height: 65)
                                .shadow(color: Color(red: 0.14, green: 0.15, blue: 0.16).opacity(0.25), radius: 10, x: 0, y: 1)
                            // Normal
                            Text("Event yang ada di booth")
                              .font(Font.custom("Montserrat", size: 15))
                              .foregroundColor(.black)
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(0)
                    .frame(width: 299, height: 445, alignment: .topLeading)
                }
                
                //button
                HStack {
                    // LEFT BUTTON: Back (hanya muncul jika currentStep > 1)
                    if currentStep > 1 {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                currentStep -= 1
                            }
                        }) {
                            Image("backbutton")
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                    } else {
                        Spacer()
                            .frame(width: 60, height: 60)
                    }

                    Spacer()

                    // RIGHT BUTTON
                    Button(action: {
                        if currentStep < totalSteps {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                currentStep += 1
                            }
                        } else {
                            // Action untuk selesai onboarding
                            // Misalnya: dismiss onboarding atau navigate ke MainTabView
                            print("Onboarding completed")
                            // Tambah action navigasi di sini
                        }
                    }) {
                        Image(currentStep < totalSteps ? "nextbutton" : "donebutton")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
                .padding(0)
                .frame(width: 299)
            }
//            .padding(.bottom, 50)
        }
    }
    
    private func getTitleForStep() -> String {
        switch currentStep {
        case 1:
            return "Datang ke salah satu booth JxB yang kamu mau"
        case 2:
            return "Yuk, Pindai kode QR Informasi yang ada di booth"
        case 3:
            return "Akses berbagai informasi brand yang kamu datangi"
        default:
            return ""
        }
    }
}

#Preview {
    OnBoardingView()
}
