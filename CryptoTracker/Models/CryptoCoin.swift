//
//  CryptoCoin.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import Foundation

struct CryptoCoin: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double
}
