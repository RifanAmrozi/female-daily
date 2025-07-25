//
//  BrandEventCardView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 25/07/25.
//

import SwiftUI

struct BrandEventCardView: View {
    let eventname: String
    let image: String
    let time: String
    let booth: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 139.99998, height: 86)
                .background(
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 139.99998474121094, height: 86)
                        .clipped()
                )
//                .cornerRadius(16)
            VStack(alignment: .center, spacing: 24) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(time)
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(.black)
                        .frame(width: 115, alignment: .topLeading)
                    
                    Text(eventname)
                        .font(
                            Font.custom("Inter", size: 16)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                        .frame(maxWidth: 115, alignment: .topLeading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Text(booth)
                    .font(
                        Font.custom("Inter", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .frame(width: 115, alignment: .topLeading)
                
            }
            .padding(.horizontal, 8)
            .padding(.top, 0)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .padding(0)
        .frame(width: 140, height: 212, alignment: .topLeading)
        .background(.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .inset(by: 0.25)
                .stroke(Constants.GreyscaleGrey600, lineWidth: 0.5)
        )
        .opacity(0.8)
    }
}

#Preview {
    BrandEventCardView(eventname: "Cici dan Mas Bule", image: "cicibule", time: "Pukul 11:00", booth: "Booth Amira")
        .padding()
        .background(Color.black.opacity(0.2))
}
