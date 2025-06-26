//
//  HomeVM.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import Foundation
import Combine

final class HomeVM {
    @Published var cryptoCoins: [CoinGeckoModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables: Set<AnyCancellable> = []
    private let service: CoinGeckoServiceProtocol
    
    init(service: CoinGeckoServiceProtocol = CoinGeckoService.shared) {
        self.service = service
        fetchData()
    }
    
    private func fetchData() {
        isLoading = true
        
        service.fetchCoins()
            .sink(receiveCompletion: { [weak self] complation in
                guard let self = self else { return }
                self.isLoading = false
                
                switch complation {
                case . finished:
                    print("HomeVM: Fetch completed")
                    self.errorMessage = nil
                case .failure(let error):
                    print("HomeVM: Fetch failed: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue:   {[ weak self ] coins in
                guard let self = self else { return }
                self.cryptoCoins = coins
                print("HomeVM: Fetched \(coins.count) coins" )
            })
            .store(in: &cancellables)
    }
}
