//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView {
            let storage = UserDefaultsWatchlistStorage()
            let vm = CoinListViewModel(service: CoinGeckoService(), storage: storage)
            NavigationView {
                CoinListView(viewModel: vm)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationView {
                WatchlistView(storage: storage)
            }
            .tabItem {
                Label("Watch List", systemImage: "list.star")
            }
        }
    }
}

#Preview {
    HomePage()   
}
