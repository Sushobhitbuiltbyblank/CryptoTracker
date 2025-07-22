//
//  StorageManager.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//
import Foundation

protocol WatchlistStorage {
    func loadWatchlist() -> [String: CryptoCoin]
    func saveWatchlist(_ watchlist: [String: CryptoCoin])
    func getListOfItems() -> [CryptoCoin]
    func remove(coinID: String) -> Bool
}

class UserDefaultsWatchlistStorage: WatchlistStorage {
    private let key = "watchlist"

    func loadWatchlist() -> [String: CryptoCoin] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let coins = try? JSONDecoder().decode([String : CryptoCoin].self, from: data) else {
            return [:]
        }
        return coins
    }

    func saveWatchlist(_ watchlist: [String: CryptoCoin]) {
        if let data = try? JSONEncoder().encode(watchlist) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func getListOfItems() -> [CryptoCoin] {
        Array(loadWatchlist().values)
    }
    
    func remove(coinID: String) -> Bool {
        var map = loadWatchlist()
        if map[coinID] != nil {
            map[coinID] = nil
            saveWatchlist(map)
            return true
        }
        return false
    }
}
