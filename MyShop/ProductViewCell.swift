//
//  ProductViewCell.swift
//  MyShop
//
//  Created by Artem Pavlov on 13.10.2022.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    //MARK: - Public Properties
    let imageViewCell: ProductImageView = {
        let image = ProductImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    //MARK: - Cell Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupItem()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Public Methods
    func configureCell(with product: Product) {
        imageViewCell.image = nil
        imageViewCell.fetchImage(from: product.image ?? "")
    }
    
    //MARK: - Private Methods
    private func setupItem() {
        addSubview(imageViewCell)
        imageViewCell.constraintsFill(to: self)
    }
}

//MARK: - Setup Constraints
extension UIView {
    func constraintsFill(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
