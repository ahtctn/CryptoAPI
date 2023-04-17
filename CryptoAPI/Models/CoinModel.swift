//
//  CoinModel.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 15.04.2023.
//

import Foundation

struct CoinModel: Codable {
    let id: Int
    let name: String
    let max_supply: Int?
    let cmc_rank: Int
    let quote: QuoteModel
}

struct QuoteModel: Codable {
    let CAD: CADModel
}

struct CADModel: Codable {
    let price: Double
    let market_cap: Double
}

extension CoinModel {
    public static func getMockArray() -> [CoinModel] {
        return [
            CoinModel(id: 1, name: "Bitcoin", max_supply: 200, cmc_rank: 1, quote: QuoteModel(CAD: CADModel(price: 50_000, market_cap: 1_000_000))),
            CoinModel(id: 2, name: "Ethereum", max_supply: nil, cmc_rank: 2, quote: QuoteModel(CAD: CADModel(price: 2_000, market_cap: 500_000))),
            CoinModel(id: 3, name: "Bitcoin", max_supply: nil, cmc_rank: 3, quote: QuoteModel(CAD: CADModel(price: 200, market_cap: 250_000))),
            CoinModel(id: 1, name: "Bitcoin", max_supply: 200, cmc_rank: 1, quote: QuoteModel(CAD: CADModel(price: 50_000, market_cap: 1_000_000))),
            CoinModel(id: 2, name: "Ethereum", max_supply: nil, cmc_rank: 2, quote: QuoteModel(CAD: CADModel(price: 2_000, market_cap: 500_000))),
            CoinModel(id: 3, name: "Bitcoin", max_supply: nil, cmc_rank: 3, quote: QuoteModel(CAD: CADModel(price: 200, market_cap: 250_000))),
            CoinModel(id: 1, name: "Bitcoin", max_supply: 200, cmc_rank: 1, quote: QuoteModel(CAD: CADModel(price: 50_000, market_cap: 1_000_000))),
            CoinModel(id: 2, name: "Ethereum", max_supply: nil, cmc_rank: 2, quote: QuoteModel(CAD: CADModel(price: 2_000, market_cap: 500_000))),
            CoinModel(id: 3, name: "Bitcoin", max_supply: nil, cmc_rank: 3, quote: QuoteModel(CAD: CADModel(price: 200, market_cap: 250_000))),
            CoinModel(id: 1, name: "Bitcoin", max_supply: 200, cmc_rank: 1, quote: QuoteModel(CAD: CADModel(price: 50_000, market_cap: 1_000_000))),
            CoinModel(id: 2, name: "Ethereum", max_supply: nil, cmc_rank: 2, quote: QuoteModel(CAD: CADModel(price: 2_000, market_cap: 500_000))),
            CoinModel(id: 3, name: "Bitcoin", max_supply: nil, cmc_rank: 3, quote: QuoteModel(CAD: CADModel(price: 200, market_cap: 250_000))),
            CoinModel(id: 1, name: "Bitcoin", max_supply: 200, cmc_rank: 1, quote: QuoteModel(CAD: CADModel(price: 50_000, market_cap: 1_000_000))),
            CoinModel(id: 2, name: "Ethereum", max_supply: nil, cmc_rank: 2, quote: QuoteModel(CAD: CADModel(price: 2_000, market_cap: 500_000))),
            CoinModel(id: 3, name: "Bitcoin", max_supply: nil, cmc_rank: 3, quote: QuoteModel(CAD: CADModel(price: 200, market_cap: 250_000)))
        ]
    }
}
