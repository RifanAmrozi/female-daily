//
//  DetailBrandView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 27/07/25.
//

import SwiftUI

struct DetailBrandView: View {
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 219, maxHeight: 219)
                    .background(
                        Image("kahf")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    )
                VStack(alignment: .center, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        // Title
                        Text("KAHF")
                            .font(
                                Font.custom("Montserrat", size: 28)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.PrimaryAccentPrimary700)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("Face Wash")
                                .font(
                                    Font.custom("Montserrat", size: 12)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                        .padding(8)
                        .background(Constants.PrimaryAccentPrimary100)
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .inset(by: -0.5)
                                .stroke(Constants.PrimarySecondary400, lineWidth: 1)
                        )
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 8) {
                                Image(systemName: "link")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                
                                // Caption
                                Link("https://www.kahfeveryday.com/", destination: URL(string: "https://www.kahfeveryday.com/")!)
                                    .font(Font.custom("Montserrat", size: 12))
                                    .underline(true, pattern: .solid)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(alignment: .center, spacing: 8) {
                                Image(systemName: "mappin")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 16, height: 16)
                                
                                // Caption
                                Text("Hall A")
                                    .font(Font.custom("Montserrat", size: 12))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            }
                            .padding(0)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Informasi Brand")
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Constants.PrimarySecondary700)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text("KAHF Face Care adalah rangkaian perawatan kulit wajah berbahan dasar alami, diformulasikan khusus untuk menjaga kesehatan kulit, melembapkan, dan membantu mengatasi permasalahan kulit seperti jerawat, kusam, dan tanda penuaan dini.")
                            .font(Font.custom("Montserrat", size: 15))
                            .lineLimit(isExpanded ? nil : 3)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Button(action: {
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }) {
                                Text(isExpanded ? "Tutup" : "Baca selengkapnya")
                                    .font(Font.custom("Montserrat", size: 15).weight(.bold))
                                    .foregroundColor(Constants.PrimaryAccentPrimary800)
                            }
                        
//                        Text("Baca selengkapnya")
//                            .font(
//                                Font.custom("Montserrat", size: 15)
//                                    .weight(.bold)
//                            )
//                            .foregroundColor(Constants.PrimaryAccentPrimary800)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 18)
                    .padding(.vertical, 8)
                    .background(Constants.PrimaryAccentPrimary100)
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Flash Sale")
                            .font(
                                Font.custom("Montserrat", size: 20)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.PrimaryAccentPrimary700)
                        
                        HStack(alignment: .center, spacing: 36) {
                            VStack(alignment: .center, spacing: 8) {
                                Text("Batch 1")
                                    .font(
                                        Font.custom("Montserrat", size: 15)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .top)
                                
                                VStack(alignment: .center, spacing: 0) {
                                    Text("11:00")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                    
                                    Text("-")
                                        .font(Font.custom("Montserrat", size: 15))
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                        .frame(height:23)
                                    
                                    Text("12:00")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Constants.PrimaryAccentPrimary200)
                                .cornerRadius(8)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Batch 2")
                                    .font(
                                        Font.custom("Montserrat", size: 15)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, minHeight: 23, maxHeight: 23, alignment: .top)
                                
                                VStack(alignment: .center, spacing: 0) {
                                    
                                    Text("13:00")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                    
                                    Text("-")
                                        .font(Font.custom("Montserrat", size: 15))
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                        .frame(height:23)
                                    
                                    Text("15:00")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Constants.PrimaryAccentPrimary100)
                                .cornerRadius(8)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Batch 3")
                                    .font(
                                        Font.custom("Montserrat", size: 15)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, minHeight: 23, maxHeight: 23, alignment: .top)
                                
                                VStack(alignment: .center, spacing: 0) {
                                    
                                    Text("20:00")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                    
                                    Text("-")
                                        .font(Font.custom("Montserrat", size: 15))
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                        .frame(height:23)
                                    
                                    Text("21:00")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.bold)
                                        )
                                        .foregroundColor(Constants.GreyscaleGrey950)
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Constants.PrimaryAccentPrimary100)
                                .cornerRadius(8)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .center, spacing: 8) {
                        HStack(alignment: .center, spacing: 10) {
                            Text("List Produk dan Harga")
                                .font(
                                    Font.custom("Montserrat", size: 20)
                                        .weight(.bold)
                                )
                                .foregroundColor(Constants.PrimaryAccentPrimary700)
                        }
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image("pricelist")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 518)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Booth Event")
                            .font(
                                Font.custom("Montserrat", size: 20)
                                    .weight(.bold)
                            )
                            .foregroundColor(Constants.PrimaryAccentPrimary700)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 344.99997, height: 86)
                                .background(
                                    Image("bootheventphoto")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 344.9999694824219, height: 86)
                                        .clipped()
                                )
                            
                            VStack(alignment: .center, spacing: 16) {
                                Text("Day 1, Pukul 11:00")
                                    .font(Font.custom("Inter", size: 14))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                
                                Text("Cici dan Mas bule")
                                    .font(
                                        Font.custom("Inter", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(.horizontal, 8)
                            .padding(.top, 0)
                            .padding(.bottom, 16)
                            .frame(maxWidth: .infinity, alignment: .top)
                        }
                        .padding(0)
                        .frame(width: 345, alignment: .topLeading)
                        .background(.white)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .inset(by: 0.25)
                                .stroke(Constants.GreyscaleGrey600, lineWidth: 0.5)
                        )
                        .opacity(0.8)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(spacing: 8) {
                        HStack(alignment: .center, spacing: 10) {
                            Text("Cara mendapatkan Freebies")
                                .font(
                                    Font.custom("Montserrat", size: 20)
                                        .weight(.bold)
                                )
                                .foregroundColor(Constants.PrimaryAccentPrimary700)
                        }
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("1. Follow Instagram @kahf\n2. Post insta story foto booth dan tag @kahf dan 5 temanmu\n3. Tunjukkan ke Penjaga Booth dan Scan QR penyelesaian misi")
                            .font(Font.custom("Montserrat", size: 15))
                            .foregroundColor(.black)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Booth KAHF")
            .navigationBarTitleDisplayMode(.inline) // Supaya judul di tengah
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.backward")
                }
            }
        }
    }
}

#Preview {
    DetailBrandView()
}
