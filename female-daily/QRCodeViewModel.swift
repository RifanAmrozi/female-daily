import Foundation
import SwiftUI
import Combine
import UIKit

class QRCodeViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func generateQRCode(for data: String) {
        guard let url = URL(string: "http://10.60.59.97:8080/api/v1/qr/generate") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["data": data]
        request.httpBody = try? JSONEncoder().encode(body)

        isLoading = true
        errorMessage = nil

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    return
                }

                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }

                print("DEBUG: Raw response = \(String(data: data, encoding: .utf8) ?? "nil")")

                guard let result = try? JSONDecoder().decode(QRResponse.self, from: data) else {
                    self?.errorMessage = "Failed to decode API response"
                    return
                }


                let base64String = result.imageBase64.replacingOccurrences(of: "data:image/png;base64,", with: "")

                guard let imageData = Data(base64Encoded: base64String),
                      let uiImage = UIImage(data: imageData) else {
                    self?.errorMessage = "Failed to decode base64 image"
                    return
                }

                self?.image = uiImage


                self?.image = uiImage

            }
        }.resume()
    }

    struct QRResponse: Decodable {
        let imageBase64: String

        enum CodingKeys: String, CodingKey {
            case imageBase64 = "image_base64"
        }
    }

}
