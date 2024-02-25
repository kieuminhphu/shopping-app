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

extension Product {
    static var sampleData: [Product]  {
        return [Product(id: "1",
                        name: "Nike Air Force 1",
                        description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                        image: "nike-pegasus",
                        modelName: "pegasus_trail",
                        price: Price(value: 125, currency: Currency.usd)),
                Product(id: "2",
                        name: "Teapot",
                        description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                        image: "teapot",
                        modelName: "teapot",
                        price: Price(value: 312, currency: Currency.euro))]
    }
}
