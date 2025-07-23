//
//  TiketModel.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 23/07/25.
//

import Foundation

class TiketModel: Codable {
    var id: String
    var eventName: String
    var status: String
    var expiredAt: String
    
    init(id: String, eventName: String, status: String, expiredAt: String) {
        self.id = id
        self.eventName = eventName
        self.status = status
        self.expiredAt = expiredAt
    }
    
    static func getDummyData() -> [TiketModel] {
        return [
            TiketModel(
                id: "123456789",
                eventName: "Gold Ticket Jakarta X Beauty 2025 - VIP MKT Partner",
                status: "Belum ditukar",
                expiredAt: "2025-08-08"
            ),
            TiketModel(
                id: "334456774",
                eventName: "Gold Ticket Jakarta X Beauty 2025 - VIP MKT Partner",
                status: "Sudah ditukar",
                expiredAt: "2025-08-08"
            ),
            TiketModel(
                id: "999999999",
                eventName: "Gold Ticket Jakarta X Beauty 2025 - VIP MKT Partner",
                status: "Kadaluwarsa",
                expiredAt: "2025-05-05"
            )
        ]
    }
}
