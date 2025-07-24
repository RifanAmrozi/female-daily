import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let qrString: String
    @StateObject private var viewModel = QRCodeViewModel()
    @Binding var selectedTab: String
    @State private var showModal = false

    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showModal = false
                    }
                
                CustomModalView(selectedTab: $selectedTab) {
                    showModal = false
                    selectedTab = "tiketsaya"
                }
                .transition(.scale)
                .zIndex(1)
            } else {
                VStack(alignment: .center) {
                    Text("GOLD – VIP MKT Partner")
                        .foregroundColor(.red)
                        .font(.headline)
                    
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let image = viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .interpolation(.none)
                                .frame(width: 300, height: 300)
                                .onTapGesture {
                                    showModal = true
                                }
                    } else if let error = viewModel.errorMessage {
                        Text("❌ \(error)")
                            .foregroundColor(.red)
                    } else {
                        Text("QR belum dibuat")
                    }
                    
                    VStack {
                        Text("ID Ticket")
                            .font(.caption)
                            .foregroundColor(.red)
                        Text(qrString)
                            .font(.footnote)
                            .bold()
                    }
                    
                    Spacer()
                }
                .padding()
                .onAppear {
                    viewModel.generateQRCode(for: qrString)
                }
            }
        }
        .animation(.easeInOut, value: showModal)
    }
}


struct QRCodeGenerator {
    static func generate(from string: String) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage,
           let cgimg = context.createCGImage(outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10)), from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
        return nil
    }
}
