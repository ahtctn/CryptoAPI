//
//  CryptoDetailViewController.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 17.04.2023.
//

import UIKit

class CryptoDetailViewController: UIViewController {

    //MARK: PROPERTIES
    private let coin: CoinModel
    
    //MARK: OUTLETS
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private let contentView: UIView = {
        let cv = UIView()
        return cv
    }()
    
    private let coinLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "person.fill")
        iv.tintColor = .label
        return iv
    }()
    
    private let rankLabel: UILabel = {
        let rl = UILabel()
        rl.textColor = .label
        rl.textAlignment = .center
        rl.font = .systemFont(ofSize: 20, weight: .semibold)
        rl.text = "RankLabelError "
        return rl
    }()
    
    private let priceLabel: UILabel = {
        let rl = UILabel()
        rl.textColor = .label
        rl.textAlignment = .center
        rl.font = .systemFont(ofSize: 20, weight: .semibold)
        rl.text = "PriceLabelError "
        return rl
    }()
   
    private let marketCapLabel: UILabel = {
        let rl = UILabel()
        rl.textColor = .label
        rl.textAlignment = .center
        rl.font = .systemFont(ofSize: 20, weight: .semibold)
        rl.text = "MarketCapLabelError "
        return rl
    }()
    
    private let maxSupplyLabel: UILabel = {
        let rl = UILabel()
        rl.textColor = .label
        rl.textAlignment = .center
        rl.font = .systemFont(ofSize: 20, weight: .semibold)
        rl.numberOfLines = 100
        return rl
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rankLabel, priceLabel, marketCapLabel, maxSupplyLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    //MARK: LIFECYCLE
    
    init(coin: CoinModel) {
        self.coin = coin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    //MARK: FUNCTIONS
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = self.coin.name
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        self.rankLabel.text = self.coin.cmc_rank.description
        self.priceLabel.text = self.coin.quote.CAD.price.description
        self.marketCapLabel.text = self.coin.quote.CAD.market_cap.description
        self.maxSupplyLabel.text = self.coin.max_supply?.description
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(coinLogo)
        self.contentView.addSubview(vStack)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let height = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        height.priority = UILayoutPriority(1)
        height.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            coinLogo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            coinLogo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            coinLogo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            coinLogo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            vStack.topAnchor.constraint(equalTo: coinLogo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        
        ])
    }
    
    //MARK: ACTIONS
    

}
