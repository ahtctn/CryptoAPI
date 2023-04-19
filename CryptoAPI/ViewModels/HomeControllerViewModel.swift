//
//  HomeControllerViewModel.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 19.04.2023.
//

import UIKit

class HomeControllerViewModel {
    
    //MARK: PROPERTIES
    var onCoinsUpdated: (() -> Void)?
    var onErrorMessage: ((CoinServiceError) -> Void)?
    
    private(set) var coins: [CoinModel] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    init() {
        self.fetchCoins()
    }
    
    //MARK: FUNCTIONS
    public func fetchCoins() {
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
                print("DEBUG PRINT: \(coins.count) coins fetched.")
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
                
        }
    }
    
}
