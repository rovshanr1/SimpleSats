//
//  TokenSectionVM.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 15.06.25.
//

import Foundation
import Combine

class TokenSectionVM{
    @Published var tokenCardViewModels: [TokenCardViewModel] = []
    
    init(coins: [CoinGeckoModel]) {
        self.tokenCardViewModels = coins.map { TokenCardViewModel(coin: $0)}
    }
    
    func updateCoins(_ coins: [CoinGeckoModel]) {
        self.tokenCardViewModels = coins.map { TokenCardViewModel(coin: $0)}
    }
}
