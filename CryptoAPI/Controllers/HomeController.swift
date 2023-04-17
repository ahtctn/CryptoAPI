//
//  ViewController.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 14.04.2023.
//

import UIKit

class HomeController: UIViewController{
    

    //MARK: PROPERTIES
    
    private let coin: [CoinModel] = CoinModel.getMockArray()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        return tv
    }()
    
    
    //MARK: UI COMPONENTS
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    //MARK: FUNCTIONS

    private func setupUI() {
        self.navigationItem.title = "CryptoAPI"
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        
        self.view.backgroundColor = .gray
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
        ])
    }
    
    //MARK: ACTIONS

}

extension HomeController: UITableViewDelegate {
    
}

extension HomeController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coin.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else { fatalError("Unable to dequeue CoinCell in HomeController")}
        
        let coinCell = self.coin[indexPath.row]
        
        cell.configure(with: coinCell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let coinCell = self.coin[indexPath.row]
        let vc = CryptoDetailViewController(coin: coinCell)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}