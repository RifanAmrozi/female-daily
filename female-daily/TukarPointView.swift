//
//  TukarPointView.swift
//  female-daily
//
//  Created by Rif'an Amrozi on 25/07/25.
//

import SwiftUI

struct TukarPoinView: View {
    @StateObject private var viewModel = RewardViewModel()

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // handle back
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Tukar Poin")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Image("coin") // replace with your asset name
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("\(viewModel.user?.point ?? 0)")
                        .fontWeight(.bold)
                }
            }
            .padding()

            Image("bunny") // 🐰 your template image asset
                .resizable()
                .scaledToFit()
                .frame(height: 140)

            Text("Poin Berlaku hingga : 31 Desember 2025 )")
                .foregroundColor(.pink)
                .fontWeight(.semibold)
                .padding(.top, 5)

            Text("Tukar poin kamu")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .padding(.top, 8)

            // Tabs
            HStack(spacing: 10) {
                ForEach(["Semua", "Freebies", "Voucher"], id: \.self) { title in
                    Text(title)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(title == "Semua" ? Color.pink : Color.white)
                        .foregroundColor(title == "Semua" ? .white : .pink)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.pink, lineWidth: 1)
                        )
                        .cornerRadius(20)
                }
            }
            .padding(.top, 10)

            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                    ForEach(mockRewards) { item in
                        RewardCard(item: item)
                    }
                }
                .padding()
            }

            Spacer()
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}
struct RewardItem: Identifiable {
    let id = UUID()
    let brand: String
    let imageName: String
    let rewardText: String
    let cost: Int
}

struct RewardCard: View {
    let item: RewardItem

    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 60)

            Text(item.rewardText)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)

            HStack {
                Text("Tukar")
                Image("coin")
                    .resizable()
                    .frame(width: 14, height: 14)
                Text("\(item.cost)")
                    .bold()
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding()
        .background(Color.pink.opacity(0.1))
        .cornerRadius(16)
    }
}

let mockRewards: [RewardItem] = [
    RewardItem(brand: "MYKONOS", imageName: "mykonos", rewardText: "Diskon 15% s/d Rp. 50,000,00", cost: 10),
    RewardItem(brand: "SKINTIFIC", imageName: "skintific", rewardText: "Diskon 15% s/d Rp. 50,000,00", cost: 20),
    RewardItem(brand: "Base", imageName: "base", rewardText: "Diskon 15% s/d Rp. 50,000,00", cost: 10),
    RewardItem(brand: "Crusita", imageName: "crusita", rewardText: "Diskon 15% s/d Rp. 50,000,00", cost: 10),
]
#Preview {
    TukarPoinView()
}
