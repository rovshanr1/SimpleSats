//
//  HomeVMTests.swift
//  SimpleSatsTests
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import XCTest
import Combine
@testable import SimpleSats

final class HomeVMTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    
    class MockCoinGeckoService: CoinGeckoServiceProtocol {
        func fetchCoins() -> AnyPublisher<[CoinGeckoModel], NetworkError> {
            let dummyCoin = CoinGeckoModel.mock
            return Just([dummyCoin])
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    }
    
    func testFetchCoinReturnsData() {
        let vM = HomeVM(service: MockCoinGeckoService())
        
        let expectation = XCTestExpectation(description: "Fetch coins from mock service")

        vM.$cryptoCoins
            .sink { coins in
                XCTAssertEqual(coins.count, 1)
                XCTAssertEqual(coins.first?.name, "Bitcoin")
                expectation.fulfill()
                
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 5.0)
    }
    
}
