//
//  Shop.swift
//  MyShop
//
//  Created by Artem Pavlov on 13.10.2022.
//

import Foundation

struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Float?
    let category: String?
    let description: String?
    let image: String?
}
