//
//  BackendModel.swift
//  female-daily
//
//  Created by Rif'an Amrozi on 25/07/25.
//


struct Mission: Decodable {
    let id: Int
    let name: String
    let description: String
    let point: Int
    let status: String // "Pending", "Completed"
    let brand: Brand
}
struct Brand: Decodable {
    let id: Int
    let name: String
    let crowdCount: Int
    let increaseCount: Int
    let description: String
    let category: String?
    let hall: String?

    private enum CodingKeys: String, CodingKey {
        case id, name, description, category, hall
        case crowdCount = "crowd_count"
        case increaseCount = "increase_count"
    }
}
struct Ticket: Decodable {
    let id: String
    let name: String
    let status: String // "Belum ditukar", "Sudah ditukar", "Kadaluarsa"
    let expiredAt: Date

    private enum CodingKeys: String, CodingKey {
        case id, name, status, expiredAt = "expired_at"
    }
}
