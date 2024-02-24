//
//  ProductRepository.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

protocol ProductRepository {
    func fetchProducts() async throws -> [Product]
}
