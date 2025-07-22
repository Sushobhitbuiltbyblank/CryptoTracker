# 🚀 CryptoTracker

[![Swift Version](https://img.shields.io/badge/Swift-6.0-orange?logo=swift&logoColor=white)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-15%2B-blue)](https://developer.apple.com/ios/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Build Status](https://img.shields.io/github/actions/workflow/status/Sushobhitbuiltbyblank/CryptoTracker/swift.yml?branch=main)](https://github.com/Sushobhitbuiltbyblank/CryptoTracker/actions)

---

## Welcome to CryptoTracker 👋  
A SwiftUI iOS app to track the top 20 cryptocurrencies, with persistent watchlist storage, search/filter, and auto-refresh.

---
## Project Demo
The following GIF showcases the core functionality of the project:

![Demo of functionality](https://github.com/Sushobhitbuiltbyblank/CryptoTracker/blob/main/SimulatorScreenRecording-iPhone16Pro-2025-07-23at00.53.18-ezgif.com-speed.gif)

----
## 🎯 Features

- Top 20 coins with live price updates every 60 seconds  
- Watchlist management (add/remove coins stored fully locally)  
- Instant search & filter by coin name or symbol  
- MVVM architecture with Combine and async/await  
- Simple, clean UI with snapshots in `Screens/`

---

## 🧑‍💻 Platform & Tech
- Language: Swift 5, SwiftUI, Combine
- Platform: iOS 15+ (Xcode 15+)
- Data: CoinGecko API
- Persistence: Codable + UserDefaults
- Architecture: MVVM

---

## 📦 Project Structure

<Code>CryptoTracker/
├── Assets.xcassets/           # Icons, color sets, app visuals
├── CryptoTrackerApp.swift     # App entry
├── Models/                    # Data models (CryptoCoin, CoinRequest)
├── Network/                   # API management
├── Screens/
│   ├── Home Tab/              # Main tabs structure
│   ├── HomeList/              # Coin list views and view model
│   └── WatchList/             # Watchlist screen
├── Services/                  # Networking, storage logic
├── CryptoTrackerTests/        # Unit tests
└── CryptoTrackerUITests/      # UI/launch tests
</Code>

---

## 🛠 Setup Instructions

### Requirements

- macOS 12+
- Xcode 15+
- iOS 15+ (Simulator or real device)

### Installation
- git clone https://github.com/Sushobhitbuiltbyblank/CryptoTracker.git
- cd CryptoTracker
- Open CryptoTracker.xcodeproj
- Build and run the project in Xcode (⌘R).

---

## ⚙️ Assumptions & Shortcuts

- Only top 20 coins shown; no pagination yet  
- Watchlist stores full coin objects in UserDefaults  
- Basic error handling and default system theming  
- No advanced persistence or offline cache yet  
- Designed for rapid prototyping and easy extension  

---

## 💡 Future Improvements
- Add sorting (price, market cap, change)
- Add pagination and more detailed coin views
- Expand persistent storage (CoreData, Keychain, or cloud sync)
- Enhance UI/UX with more themes and animations
- Offline fallback for last-fetched coins and richer error UI
- Add XCTest-backed unit and UI test coverage

---

## 📝 License

MIT License © Sushobhit Jain

---

## 📫 Contact

Created by [Sushobhit Jain](https://github.com/sushobhitjain). Feel free to reach out!

---




