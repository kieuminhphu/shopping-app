//
//  ProductionItemViewModel.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import Foundation

struct ProductItemViewModel: Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
    let image: String
    let modelName: String
    let price: String
    
    static var sampleData: [ProductItemViewModel] {
        return [ProductItemViewModel(id: "1",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "2",
                                     name: "Teapot",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "teapot",
                                     modelName: "teapot",
                                     price: "125$"),
                ProductItemViewModel(id: "3",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "4",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "5",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "6",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "7",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "8",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "9",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),
                ProductItemViewModel(id: "10",
                                     name: "Nike Air Force 1",
                                     description: "Debuting in 1982, the AF-1 was the first basketball shoe to house Nike Air, revolutionising the game while rapidly gaining traction around the world. Today, the Air Force 1 stays true to its roots with the same soft and springy cushioning that changed sneaker history.",
                                     image: "nike-pegasus",
                                     modelName: "pegasus_trail",
                                     price: "125$"),]
    }
}
