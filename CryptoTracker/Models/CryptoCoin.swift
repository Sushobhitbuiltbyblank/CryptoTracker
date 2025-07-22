//
//  CryptoCoin.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import Foundation

struct CryptoCoin: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let currentPrice: Double
}
