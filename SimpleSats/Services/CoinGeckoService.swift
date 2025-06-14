//
//  CoinGeckoService.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import Foundation
import Combine

protocol CoinGeckoServiceProtocol {
    func fetchCoins() -> AnyPublisher<[CoinGeckoModel], NetworkError>
}

class CoinGeckoService: CoinGeckoServiceProtocol{
    static let shared = CoinGeckoService()
    
    private init() {}
    
    func fetchCoins() -> AnyPublisher<[CoinGeckoModel], NetworkError> {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return NetworkManager.shared.request(url: url)
            .eraseToAnyPublisher()
        
    }
}
