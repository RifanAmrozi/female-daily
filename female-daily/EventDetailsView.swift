    //
    //  EventDetailsView.swift
    //  female-daily
    //
    //  Created by Evelyn Wijaya on 23/07/25.
    //

    import SwiftUI

    struct EventDetailsView: View {
        var body: some View {
            NavigationStack {
                ScrollView{
                    VStack(spacing:24){
                        //banner
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, minHeight: 115)
                            .background(
                                Image("eventdetail")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                            )
                        
                        //peta jxb
                        VStack {
                            HStack(alignment: .center, spacing: 16) {
                                Image("maskotpeta")
                                    .resizable()
                                    .frame(width: 103.99997, height: 93.1115)
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    VStack(spacing: 4) {
                                        Text("Mau cari booth?")
                                            .font(
                                                Font.custom("Montserrat", size: 20)
                                                    .weight(.bold)
                                            )
                                            .foregroundColor(Constants.PrimaryAccentPrimary800)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top, 8)
                                        Text("Lihat peta yuk biar nggak nyasar!")
                                            .font(
                                                Font.custom("Montserrat", size: 12)
                                                    .weight(.medium)
                                            )
                                            .foregroundColor(Constants.GreyscaleGrey950)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    NavigationLink(destination: PetaView())
                                                    {
                                        HStack(alignment: .center) {
                                            // Space Between
                                            Text("Peta JxB 2025")
                                                .font(
                                                    Font.custom("Montserrat", size: 15)
                                                        .weight(.semibold)
                                                )
                                                .foregroundColor(Constants.PrimaryAccentPrimary700)
                                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                            Spacer()
                                            // Alternative Views and Spacers
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .font(Font.system(size: 12).weight(.bold))
                                                .frame(width: 6.58489, height: 11.16578)
                                                .foregroundColor(Constants.PrimaryAccentPrimary700)
                                        }
                                        .padding(8)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .background(Constants.BackgroundColor)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .inset(by: 0.5)
                                                .stroke(Constants.PrimaryAccentPrimary700, lineWidth: 1)
                                        )
                                    }
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120, alignment: .topLeading)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Constants.BackgroundColor)
                            .cornerRadius(8)
                            .shadow(color: Color(red: 0.43, green: 0.43, blue: 0.43).opacity(0.2), radius: 7.5, x: 0, y: 1)
                        }
                        .padding(.horizontal, 24)
                        
                        
                        //flash sale
                        VStack(alignment: .center, spacing: 0) {
                            HStack(alignment: .center) {
                                // Space Between
                                Text("Flash Sale")
                                    .font(
                                        Font.custom("Montserrat", size: 28)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Constants.PrimaryAccentPrimary800)
                                Spacer()
                                // Alternative Views and Spacers
                                HStack(alignment: .center, spacing: 4) {
                                    Text("Lihat Semua")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .font(Font.system(size: 12).weight(.bold))
                                        .frame(width: 4, height: 6)
                                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                                }
                                .padding(0)
                            }
                            .padding(0)
                            .frame(width: 345, alignment: .center)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .center, spacing: 16) {
                                    FlashSaleCardView(flashsaleimage: "mykonos", flashsalename: "MYKONOS", flashsaletime: "Pukul 11:00")
                                    FlashSaleCardView(flashsaleimage: "cruisita", flashsalename: "CRUISITA", flashsaletime: "Pukul 12:00")
                                    FlashSaleCardView(flashsaleimage: "skintific", flashsalename: "SKINTIFIC", flashsaletime: "Pukul 13:00")
                                    FlashSaleCardView(flashsaleimage: "skintific", flashsalename: "SKINTIFIC", flashsaletime: "Pukul 13:00")
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            //brands event
                            HStack(alignment: .center) {
                                // Space Between
                                Text("Brand's Event")
                                    .font(
                                        Font.custom("Montserrat", size: 28)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Constants.PrimaryAccentPrimary800)
                                Spacer()
                                // Alternative Views and Spacers
                                HStack(alignment: .center, spacing: 4) {
                                    Text("Lihat Semua")
                                        .font(
                                            Font.custom("Montserrat", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .font(Font.system(size: 12).weight(.bold))
                                        .frame(width: 4, height: 6)
                                        .foregroundColor(Constants.PrimaryAccentPrimary700)
                                }
                                .padding(0)
                            }
                            .padding(0)
                            .frame(width: 345, alignment: .center)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .center, spacing: 16) {
                                    BrandEventCardView(eventname: "Cici dan Mas Bule", image: "cicibule", time: "Pukul 11:00", booth: "Booth Amira")
                                    BrandEventCardView(eventname: "Prince", image: "prince", time: "Pukul 12:00", booth: "Booth Amira")
                                    BrandEventCardView(eventname: "Cici dan Mas Bule", image: "cicibule", time: "Pukul 13:00", booth: "Booth Amira")
                                    BrandEventCardView(eventname: "Maudy Ayunda", image: "maudy", time: "Pukul 11:00", booth: "Booth Amira")
                                    BrandEventCardView(eventname: "Influencer", image: "cewe", time: "Pukul 14:00", booth: "Booth Amira")
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .top)
                        //                    }
                    }
                }
                .navigationTitle("Event Detail")
                .navigationBarTitleDisplayMode(.inline) // Supaya judul di tengah
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }

    #Preview {
        EventDetailsView()
    }
