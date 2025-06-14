//
//  NetworkManager.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import Foundation
import Combine

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse(statusCode: Int)
    case network(error: Error)
    case decodingFaild(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse(statusCode: let statusCode):
            return "Invalid response status code: \(statusCode)"
        case .network(error: let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingFaild(error: let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
}


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable>(url: URL) -> AnyPublisher<T, NetworkError>{
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap{(data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse(statusCode: -1)
                }
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.invalidResponse(statusCode: httpResponse.statusCode)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return NetworkError.decodingFaild(error: decodingError)
                }else if let urlError = error as? URLError {
                    return NetworkError.network(error: urlError)
                }else if let networkError = error as? NetworkError {
                    return networkError
                }
                return NetworkError.network(error: error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
