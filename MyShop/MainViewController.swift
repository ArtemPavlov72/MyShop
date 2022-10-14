//
//  ViewController.swift
//  MyShop
//
//  Created by Artem Pavlov on 13.10.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    private let cellID = "cell"
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadProducts(from: "https://fakestoreapi.com/products")
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    private func loadProducts(from url: String) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let products):
                self.products = products
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProductViewCell
        let product = products[indexPath.row]
        cell.configureCell(with: product)
        return cell
    }
}

