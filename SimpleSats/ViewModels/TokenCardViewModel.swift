//
//  TokenCardViewModel.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 15.06.25.
//

import Foundation
import UIKit

struct TokenCardViewModel: Identifiable{
    let id: String
    let tokenName: String
    let percentageChange: String
    let price: String
    let absoluteChangeAndPercentageText: String
    let changeValue: String
    let isPositiveChange: Bool
    let iconColor: UIColor
    let sparklinePrices: [Double]
    
    init(coin: CoinGeckoModel ){
        self.id = coin.id
        self.tokenName = coin.name
        
        let changePercentage = coin.priceChangePercentage24H ?? 0.0
        self.isPositiveChange = changePercentage >= 0
        
        let sign: String = changePercentage >= 0 ? "+" : ""
        self.percentageChange = String(format: "%.2f%% in 24h", sign, changePercentage)
        
        self.price = "$\(String(format: "%.2f", coin.currentPrice))"

        let absoluteChange = coin.priceChange24H ?? 0.0
        let percentageInCurrency = coin.athChangePercentage ?? 0.0
        let absChangeSign = absoluteChange >= 0 ? "+" : ""
        
        self.absoluteChangeAndPercentageText = String(format: "%@%.2f (%@%.2f%%)", absChangeSign, absoluteChange, absChangeSign, percentageInCurrency)
        self.iconColor = .tokenIconColor
        
        let percentage = coin.priceChangePercentage24H ?? 0.0
        self.changeValue = String(format: "%.2f%%", percentage)
        
        self.sparklinePrices = coin.sparklineIn7D?.price ?? []

    }
}
