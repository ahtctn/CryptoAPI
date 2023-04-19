//
//  CoinService.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 19.04.2023.
//

import Foundation

enum CoinServiceError: Error {
    case serverError(CoinErrorModel)
    case unknown(String = "An unknown error occurred.")
    case decodingError(String = "Error parsing server response.")
}

class CoinService {
    static func fetchCoins(with endpoint: Endpoint, completion: @escaping(Result<[CoinModel], CoinServiceError>) -> Void ) {
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode != 200 {
                // TODO: I will handle the error here.
                
                do {
                    let coinError = try JSONDecoder().decode(CoinErrorModel.self, from: data ?? Data())
                    completion(.failure(.serverError(coinError)))
                } catch let error {
                    completion(.failure(.unknown(error.localizedDescription)))
                    print(error.localizedDescription)
                }
            }
            
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    let coinData = try decoder.decode(CoinArrayModel.self, from: data)
                    completion(.success(coinData.data))
                } catch let error {
                    completion(.failure(.decodingError(error.localizedDescription)))
                    print(error.localizedDescription)
                }
            } else {
                completion(.failure(.unknown()))
            }
            
             
        } .resume()
    }
}
