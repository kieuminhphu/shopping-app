//
//  JSProduct.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

extension JSONClient {
    struct Product: Identifiable, Codable {
        let id: String
        let name: String
        let description: String
        let image: String
        let model: String
        let price: Int
        let currency: String
    }
}
