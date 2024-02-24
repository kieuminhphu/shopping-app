//
//  JSONProductRepository.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

class JSONProductRepository: ProductRepository {
    let client: JSONClient = JSONClient()
    
    func fetchProducts() async throws -> [Product] {
        let products: [JSONClient.Product] = try client.getData(name: "product")
        return products.map { product in
            return Product.fromJSONModel(model: product)
        }
    }
}
