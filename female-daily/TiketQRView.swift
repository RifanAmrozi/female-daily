import SwiftUI
import SwiftData

struct TiketQRView: View {
    var body: some View {
        QRCodeView(qrString: "A1BJXB281")
    }
}

#Preview {
    TiketQRView()
}
