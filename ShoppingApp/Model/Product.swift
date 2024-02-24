//
//  Product.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

struct Product {
    let id: String
    let name: String
    let description: String
    let image: String
    let modelName: String
    let price: Price
}

extension Product {
    static func fromJSONModel(model: JSONClient.Product) -> Product {
        return Product(id: model.id,
                       name: model.name,
                       description: model.description,
                       image: model.image,
                       modelName: model.model,
                       price: Price(value: model.price,
                                    currency: Currency(rawValue: model.currency) ?? Currency.usd))
    }
}
