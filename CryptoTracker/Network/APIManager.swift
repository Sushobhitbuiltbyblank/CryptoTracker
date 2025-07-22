//
//  APIManager.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import Foundation

// Define error types
enum APIError: Error {
    case invalidRequest
    case invalidResponse
    case httpError(Int)
    case noData
    case decodingError(Error)
    case urlSessionError(Error)
}

final class APIManager {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get<T: Decodable>(apiclient: APIClientRequest, type: T.Type) async throws -> T {
        guard let request = apiclient.request else {
            throw APIError.invalidRequest
        }

        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.httpError(httpResponse.statusCode)
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return decoded
            } catch {
                throw APIError.decodingError(error)
            }
        } catch {
            throw APIError.urlSessionError(error)
        }
    }
}
