//
//  CoinCell.swift
//  CryptoTracker
//
//  Created by Sushobhit Jain on 22/07/25.
//

import SwiftUI

struct CoinCell: View {
    let coin: CryptoCoin
    let saved: Bool
    let onButtonTapped: (CryptoCoin) -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                onButtonTapped(coin)
            }) {
                Image(systemName: saved ? "star.fill" : "star")
            }
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.title2)
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(String(format: "$%.2f", coin.currentPrice))
        }
    }
}

#Preview {
    CoinCell(coin: CryptoCoin(id: "1", name: "Bitcoin", symbol: "BTS", currentPrice: 118923), saved: false, onButtonTapped: {_ in })
}
