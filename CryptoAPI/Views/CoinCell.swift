//
//  CoinCell.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 15.04.2023.
//

import UIKit

class CoinCell: UITableViewCell {
    
    static let identifier = "CoinCell"
    
    private(set) var coin: CoinModel!
    
    private let coinLogo: UIImageView = {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(systemName: "person.fill")
        logo.tintColor = .black
        return logo
    }()
    
    private let coinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private func setupUI() {
        self.addSubview(coinLogo)
        self.addSubview(coinLabel)
        
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinLogo.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            coinLogo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            coinLogo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            coinLabel.leadingAnchor.constraint(equalTo: coinLogo.trailingAnchor, constant: 16),
            coinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            
        ])
        
    }
    
}
