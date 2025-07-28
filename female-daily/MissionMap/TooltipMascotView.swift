//
//  TooltipMascotView.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 27/07/25.
//

import SwiftUI

struct TooltipMascotView: View {
    var onPergi: () -> Void
    var onAcak: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Spacer()
                Text("Acak Misi")
                    .font(
                        Font.custom("Montserrat", size: 12)
                            .weight(.semibold)
                    )
                    .foregroundColor(Constants.GreyscaleGrey700)
                Button(action: onAcak) {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .foregroundColor(.gray)
                }
            }
            Text("Ayo pergi ke booth ")
                .font(
                    Font.custom("Montserrat", size: 15)
                        .weight(.medium)
                )
                .foregroundColor(Constants.GreyscaleGrey950) +
            Text("Kahf").bold().foregroundColor(.pink)
                .font(  Font.custom("Montserrat", size: 15)
                    .weight(.medium)
                )
            
            Text("Jangan sampai ketinggalan hadiah menarik!")
                .font(Font.custom("Montserrat", size: 12))
                .foregroundColor(Constants.GreyscaleGrey950)
                .padding(.bottom, 16)
            
            NavigationLink(destination: MissionDetailView()) {
                // Normal
                Text("Pergi")
                    .font(
                        Font.custom("Montserrat", size: 15)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Constants.BackgroundColor)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 180/255, green: 0, blue: 50/255))
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 10)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TooltipMascotView(
        onPergi: { MissionDetailView() },
        onAcak: { print("Acak tapped") }
    )
}
