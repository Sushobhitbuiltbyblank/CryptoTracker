//
//  CoinListView.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import SwiftUI

struct CoinListView: View {
    @StateObject var viewModel: CoinListViewModel
    @State private var showError: Bool = true
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .loaded(let coins):
                let filteredCoins = coins.filter { coin in
                    searchText.isEmpty || coin.name.localizedCaseInsensitiveContains(searchText) || coin.symbol.localizedCaseInsensitiveContains(searchText)
                }
                
                if filteredCoins.isEmpty {
                    Text("No results for '\(searchText)'")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(filteredCoins) { coin in
                        CoinCell(coin: coin, saved: viewModel.isWishlisted(coin)) { coin in
                            viewModel.toggleWatchlist(for: coin)
                        }
                    }
                }
            case .error(_ ,let errorMessage):
                List {
                    Text("No Data Available")
                }
                .alert(errorMessage, isPresented: $showError) {
                    Button("OK") {
                        showError = false
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search by name or symbol")
        .onAppear {
            viewModel.loadWatchlist()
        }
        .task {
            showError = true
            await viewModel.fetchCoins()
        }
        .refreshable {
            Task {
                showError = true
                await viewModel.fetchCoins()
            }
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel(service: MockCoinGeckoService(), storage: UserDefaultsWatchlistStorage()))
}
