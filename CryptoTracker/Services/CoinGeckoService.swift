//
//  CoinGeckoService.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import Foundation

protocol CoinGeckoServiceProtocol {
    func fetchTopCoins(page: Int, limit: Int) async throws -> [CryptoCoin]
}


final class CoinGeckoService: CoinGeckoServiceProtocol {
    private let apiManager: APIManager

    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }

    func fetchTopCoins(page: Int = 1, limit: Int = 20) async throws -> [CryptoCoin] {
        do {
            // Use the APIClient enum to create the request
            let coins = try await apiManager.get(
                apiclient: CoinAPIRequest.coins(currentPage: page, pageLimit: limit),
                type: [CryptoCoin].self
            )
            return coins
        } catch {
            // Log optionally
            print("❌ API Error:", error)
            throw error
        }
    }
}


struct MockCoinGeckoService: CoinGeckoServiceProtocol {
    func fetchTopCoins(page: Int = 1, limit: Int = 20) async throws -> [CryptoCoin] {
        guard let url = Bundle.main.url(forResource: "response", withExtension: "json") else {
            throw MockServiceError.fileNotFound
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([CryptoCoin].self, from: data)
            return decoded
        } catch {
            throw MockServiceError.decodingFailed(error)
        }
    }

    enum MockServiceError: Error {
        case fileNotFound
        case decodingFailed(Error)
    }
}

