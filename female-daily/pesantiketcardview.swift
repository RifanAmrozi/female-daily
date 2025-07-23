//
//  pesantiketcardview.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 22/07/25.
//

import SwiftUI

struct pesantiketcardview: View {
    let eventname: String
    let eventdate: String
    let eventlocation: String
    let eventprice: String
    
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120)
                    .background(
                        Image("pesantiket")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 345, height: 120)
                            .clipped()
                    )
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    // Title 2
                    Text(eventname)
                        .font(
                            Font.custom("Montserrat", size: 20)
                                .weight(.bold)
                        )
                        .foregroundColor(Constants.GreyscaleGrey950)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .frame(width: 18, height: 18)
                        // Normal
                        Text(eventdate)
                            .font(Font.custom("Montserrat", size: 15))
                            .foregroundColor(Constants.GreyscaleGrey950)
                    }
                    
                    HStack {
                        Image(systemName: "map")
                            .frame(width: 18, height: 18)
                        // Normal
                        Text(eventlocation)
                            .font(Font.custom("Montserrat", size: 15))
                            .foregroundColor(Constants.GreyscaleGrey950)
                    }
                    .padding(.bottom, 8)
                    
                    VStack(alignment: .trailing, spacing: 0){
                        Text("Mulai dari")
                            .font(
                                Font.custom("Montserrat", size: 12)
                                    .weight(.light)
                            )
                            .foregroundColor(Constants.GreyscaleGrey600)
                        
                        Text(eventprice)
                            .font(
                                Font.custom("Montserrat", size: 15)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Constants.PrimaryAccentPrimary600)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(Constants.BackgroundColor)
            .cornerRadius(8)
            .shadow(color: Color(red: 0.81, green: 0.82, blue: 0.83).opacity(0.3), radius: 10, x: 0, y: -2)
    }
    
}

struct Constants {
    static let GreyscaleGrey950: Color = Color(red: 0.14, green: 0.15, blue: 0.16)
    static let BackgroundColor: Color = Color(red: 1, green: 1, blue: 1)
    static let GreyscaleGrey600: Color = Color(red: 0.34, green: 0.36, blue: 0.39)
    static let PrimaryAccentPrimary600: Color = Color(red: 0.86, green: 0.15, blue: 0.47)
}

#Preview {
    pesantiketcardview(eventname: "Jakarta X Beauty 2025", eventdate: "01 - 03 Agustus 2025", eventlocation: "Jakarta Convention Center", eventprice: "Rp. 10.000")
        .padding()
        .background(.red)
}
