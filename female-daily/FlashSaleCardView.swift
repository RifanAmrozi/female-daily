//
//  FlashSaleCardView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 23/07/25.
//

import SwiftUI

struct FlashSaleCardView: View {
    let flashsaleimage: String
    let flashsalename: String
    let flashsaletime: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .center, spacing: 8) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 72, height: 72)
                  .background(
                    Image(flashsaleimage)
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .clipped()
                  )
//                  .padding(.bottom, 8)
                VStack(spacing: 0) {
                    Text(flashsalename)
                        .font(
                            Font.custom("Montserrat", size: 15)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: 18, alignment: .top)
                    
                    // Caption
                    Text(flashsaletime)
                        .font(Font.custom("Montserrat", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: 18, alignment: .center)
                }
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .top)
            
            HStack(alignment: .center, spacing: 40) {
                Text("Ingatkan Saya")
                  .font(
                    Font.custom("Montserrat", size: 12)
                      .weight(.semibold)
                  )
                  .foregroundColor(Constants.PrimaryAccentPrimary700)
            }
            .padding(8)
            .frame(height: 34, alignment: .leading)
            .background(Constants.BackgroundColor)
            .cornerRadius(8)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(Constants.PrimaryAccentPrimary700, lineWidth: 1)
            )
        }
        .padding(8)
        .background(.white)
        .cornerRadius(8)
        .frame(width: 120, height: 182)
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .inset(by: -0.1)
            .stroke(.black, lineWidth: 0.2)
        )
    }
}

#Preview {
    FlashSaleCardView(flashsaleimage: "mykonos", flashsalename: "MYKONOS", flashsaletime: "Pukul 11:00")
        .padding()
        .background(Color.black.opacity(0.2))
}
