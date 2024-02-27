//
//  SDProduct.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 26/02/2024.
//

import Foundation
import SwiftData

extension SwiftDataProvider {
    @Model
    final class Product {
        @Attribute(.unique) let id: String
        let name: String
        let information: String
        let image: String
        let model: String
        let price: Int
        let currency: String
        
        init(id: String, name: String, information: String, image: String, model: String, price: Int, currency: String) {
            self.id = id
            self.name = name
            self.information = information
            self.image = image
            self.model = model
            self.price = price
            self.currency = currency
        }
    }
}
