//
//  CoinListViewModel.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import Foundation
import Combine

enum CoinState {
    case isLoading
    case loaded([CryptoCoin])
    case error(Error, errorMessage: String)
}

final class CoinListViewModel: ObservableObject {
    @Published var state: CoinState = .isLoading
    @Published var watchlist: [String : CryptoCoin]  = [:]
    private let storage: WatchlistStorage
    
    private let service: CoinGeckoServiceProtocol
    private var refreshTimer: Timer?
    
    init(service: CoinGeckoServiceProtocol, storage: WatchlistStorage) {
        self.service = service
        self.storage = storage
        autoRefresh()
    }
    
    func fetchCoins() async {
        state = .isLoading
        do {
            let result = try await service.fetchTopCoins(page: 1, limit: 20)
            state = .loaded(result)
        } catch {
            print("❌ Failed to fetch coins: \(error)")
            state = .error(error, errorMessage: "Failed to load coins. Please try again.")
        }
    }
    
    func toggleWatchlist(for coin: CryptoCoin) {
        if isWishlisted(coin) {
            watchlist.removeValue(forKey: coin.id)
        } else {
            watchlist[coin.id] = coin
        }
        saveWatchlist()
    }
    
    func isWishlisted(_ coin: CryptoCoin) -> Bool {
        watchlist[coin.id] != nil
    }
    
    private func saveWatchlist() {
        storage.saveWatchlist(watchlist)
    }
    
    func loadWatchlist() {
        watchlist = storage.loadWatchlist()
    }
    
    private func autoRefresh() {
        refreshTimer?.invalidate()
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { await self.fetchCoins() }
        }
    }
    
    deinit {
        Task{ @MainActor [weak self] in
            self?.refreshTimer?.invalidate()
        }
    }
}
