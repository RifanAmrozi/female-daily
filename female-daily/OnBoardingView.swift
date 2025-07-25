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
            }
            .padding(0)
            .frame(width: 313, height: 39, alignment: .leading)
            
            HStack {
                Button(action: {
                    // Action untuk close
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                // Progress indicators
                HStack(spacing: 8) {
                    ForEach(1...totalSteps, id: \.self) { step in
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 65, height: 4)
                          .background(Constants.PrimarySecondary400)
                          .cornerRadius(24)
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(step <= currentStep ? Color.pink : Color.pink.opacity(0.3))
                            .frame(width: step <= currentStep ? 40 : 30, height: 4)
                            .animation(.easeInOut(duration: 0.3), value: currentStep)
                    }
                }
                
                Spacer()
                
                // Placeholder untuk symmetry
                Color.clear
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Spacer()
            
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
                .padding(0)
                .frame(width: 297, alignment: .top)
                
                // Image
                Image("gambar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20)
                
                // Description
                Text(getDescriptionForStep())
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
            }
            
            Spacer()
            
            // Next button
            Button(action: {
                if currentStep < totalSteps {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentStep += 1
                    }
                } else {
                    // Action untuk finish onboarding
                    print("Onboarding completed")
                }
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(height: 60)
                .background(
                    Circle()
                        .fill(Color.pink)
                )
                .frame(width: 60, height: 60)
            }
            .padding(.bottom, 50)
        }
        .background(Color.white)
    }
    
    private func getTitleForStep() -> String {
        switch currentStep {
        case 1:
            return "Datang ke salah satu booth JxB yang kamu mau"
        case 2:
            return "Temukan produk kecantikan terbaikmu"
        case 3:
            return "Nikmati pengalaman belanja yang tak terlupakan"
        default:
            return ""
        }
    }
    
    private func getDescriptionForStep() -> String {
        switch currentStep {
        case 1:
            return "Kamu bisa datang ke 400+ booth brand yang kamu inginkan di Jakarta X Beauty 2025"
        case 2:
            return "Jelajahi berbagai produk skincare, makeup, dan perawatan dari brand favorit kamu"
        case 3:
            return "Dapatkan exclusive deals, bertemu beauty influencer, dan rasakan pengalaman berbelanja yang amazing"
        default:
            return ""
        }
    }
}

// Preview
//struct OnBoardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingView()
//    }
//}

#Preview {
    OnBoardingView()
}
