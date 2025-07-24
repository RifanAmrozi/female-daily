//
//  PersonalizeCard.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 24/07/25.
//

import SwiftUI

struct PersonalizeCard: View {
    let image: String
    let caption: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("bgcardpers")
                .resizable()
                .frame(width: 160, height: 160)
    
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 158.25899, height: 125.24091)
              .background(
                Image(image)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 158.2589874267578, height: 125.24091339111328)
                  .clipped()
              )
              .cornerRadius(8)
            
            // Caption
            Text(caption)
              .font(
                Font.custom("Montserrat", size: 12)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Constants.PrimaryAccentPrimary800)
              .frame(width: 128, height: 21, alignment: .top)
              .padding(.leading, 31.28)
              .padding(.bottom, 6)
              .padding(.top, 135)
            
            Image("checkboxpers")
                .frame(width: 27.32529, height: 27.32246, alignment: .center)
                .cornerRadius(8)
                .padding(8)
        }
        .frame(width: 160, height: 160)
    }
}

#Preview {
    PersonalizeCard(image: "haircare", caption: "Hair Care")
        .padding()
        .background(Color.black.opacity(0.2))
}
