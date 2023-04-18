//
//  ViewCryptoControllerViewModel.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 18.04.2023.
//

import UIKit

class ViewCryptoControllerViewModel {
    
    //MARK: PROPERTIES
    let coin: CoinModel
    var onImageLoaded: ((UIImage?) -> Void)?
    
    //MARK: INITIALIZER
    init(coin: CoinModel) {
        self.coin = coin
        self.loadImage()
    }
    
    //MARK: FUNCTIONS
    
    //MARK: COMPUTED PROPERTIES
    var rankLabel: String {
        return "Rank: \(self.coin.rank)"
    }
    
    var priceLabel: String {
        return "Price: $\(self.coin.pricingData.CAD.price)"
        
    }
    
    var marketCapLabel: String {
        return "Market Capacity: \(self.coin.pricingData.CAD.marketCap) CAD"
        
    }
    
    var maxSupplyLabel: String {
        if let maxSupply = self.coin.maxSupply {
            return "Maximum Supply: \(maxSupply)"
        } else {
            return "Maximum Supply Value cannot found."
        }
    }
    
    //MARK: FUNCTIONS
    
    private func loadImage() {
        
        DispatchQueue.global().async { [weak self] in
            if let logoURL = self?.coin.logoURL,
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data: imageData) {
                self?.onImageLoaded?(logoImage)
            }
        }
        
    }
    
    
    
}
