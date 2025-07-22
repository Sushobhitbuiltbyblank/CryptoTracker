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
               // First Tab
               Text("List")
                   .tabItem {
                       Label("Home", systemImage: "house")
                   }
               
               // Second Tab
               Text("Watchlist")
                   .tabItem {
                       Label("Watch List", systemImage: "list.star")
                   }
           }
       }
}

#Preview {
    HomePage()
}
