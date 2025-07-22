import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let qrString: String
    @StateObject private var viewModel = QRCodeViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Tiket QR")
                .font(.title2)
                .bold()

            Text("GOLD – VIP MKT Partner")
                .foregroundColor(.red)
                .font(.headline)

            if viewModel.isLoading {
                ProgressView()
            } else if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .interpolation(.none)
                    .frame(width: 200, height: 200)
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
