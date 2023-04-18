//
//  CoinModel.swift
//  CryptoAPI
///Users/ahmetalicetin/Desktop/Swift/CryptoAPI/CryptoAPI/CryptoAPI/Models/CoinModel.swift
//  Created by Ahmet Ali ÇETİN on 15.04.2023.
//

import Foundation

struct CoinModel: Codable {
    let id: Int
    let name: String
    let maxSupply: Int?
    let rank: Int
    let pricingData :  PricingDataModel
    
    var logoURL: URL? {
        return URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/\(id ).png")
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case maxSupply = "max_supply"
        case rank = "cmc_rank"
        case pricingData = "quote"
    }
}

struct CoinArrayModel: Codable {
    let data: [CoinModel]
}

struct PricingDataModel: Codable {
    let CAD: CADModel
}

struct CADModel: Codable {
    let price: Double
    let marketCap: Double
    
    enum CodingKeys: String, CodingKey {
        case price
        case marketCap = "market_cap"
    }
}
 
