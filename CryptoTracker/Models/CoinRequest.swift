//
//  CoinRequest.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import Foundation

protocol APIClientRequest {
    var request: URLRequest? { get }
}

enum CoinAPIRequest: APIClientRequest {
    case coins(currentPage: Int, pageLimit: Int)

    var baseURL: URL? {
        URL(string: "https://api.coingecko.com/api/v3/")
    }

    var component: URLComponents? {
        guard let baseURL = baseURL else { return nil }
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        switch self {
        case .coins(let currentPage, let pageLimit):
            components?.path += "coins/markets"
            components?.queryItems = [
                URLQueryItem(name: "vs_currency", value: "usd"),
                URLQueryItem(name: "order", value: "market_cap_desc"),
                URLQueryItem(name: "per_page", value: "\(pageLimit)"),
                URLQueryItem(name: "page", value: "\(currentPage)"),
                URLQueryItem(name: "sparkline", value: "false")
            ]
        }
        return components
    }

    var request: URLRequest? {
        guard let url = component?.url else { return nil }
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return req
    }

}
