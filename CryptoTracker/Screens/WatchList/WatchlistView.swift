//
//  WatchlistView.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import SwiftUI

struct WatchlistView : View {
    
    @State var watchlist: [CryptoCoin]  = []
    private let storage: WatchlistStorage
    
    init(storage: WatchlistStorage) {
        self.storage = storage
    }
    
    var body: some View {
        List(watchlist) { coin in
            CoinCell(coin: coin, saved: true) { coin in
                if storage.remove(coinID: coin.id) {
                    if let index = self.watchlist.firstIndex(of: coin) {
                        self.watchlist.remove(at: index)
                    }
                }
            }
        }.onAppear() {
            getValue()
        }
    }
    
    func getValue() {
        self.watchlist = storage.getListOfItems().sorted { $0.name > $1.name }
    }
}
