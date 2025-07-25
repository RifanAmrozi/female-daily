//
//  RewardViewModel.swift
//  female-daily
//
//  Created by Rif'an Amrozi on 25/07/25.
//
import Foundation
import Combine

struct User: Decodable {
    let id: Int
    let username: String
    let point: Int
    let personalization: [String]
}
class RewardViewModel: ObservableObject {
    @Published var user: User? = nil
    private var cancellables = Set<AnyCancellable>()

    func fetchUser() {
        guard let url = URL(string: Constants.API.baseURL+"/user/1") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print("User fetch: \(completion)")
            }, receiveValue: { [weak self] user in
                self?.user = user
            })
            .store(in: &cancellables)
    }
}
