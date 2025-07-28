//
//  ScanQRView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 24/07/25.
//

import SwiftUI

struct ScanQRView: View {
    @State private var scannedCode: String? = nil
    @Environment(\.presentationMode) var presentationMode
    @State private var goToTukarPoin = false
    @State private var selectedPage: String = "scan-qr"
    
    var body: some View {
        
        if selectedPage == "scan-qr" {
            ZStack {
                QRScannerView { code in
                    self.scannedCode = code
                    print("DEBUG: Scanned QR Code: \(code)")
                    
                    // Send POST to API
                    guard let url = URL(string: code) else {
                        print("❌ Invalid URL")
                        return
                    }
                    
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    
                    // Optional: Add body if needed
                    // request.httpBody = try? JSONEncoder().encode(["code": code])
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            print("❌ Error sending mission success: \(error)")
                            return
                        }
                        print(selectedPage)
                        if let httpResponse = response as? HTTPURLResponse {
                            selectedPage = "brand-detail"
                            print("✅ Mission success response: \(httpResponse.statusCode)")
                        }
                    }.resume()
                    print(selectedPage)
                    selectedPage = "brand-detail"
                    print(selectedPage)
                    presentationMode.wrappedValue.dismiss()
                }
                
                
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding()
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Text("Pindai kode QR informasi yang\n terdapat di Booth")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom, 80)
                }
                
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.pink, lineWidth: 4)
                    .frame(width: 250, height: 250)
                
                
            }
            .ignoresSafeArea()
        }
        else {
            DetailBrandView()
        }
    }
}

//#Preview {
//    ScanQRView()
//}
