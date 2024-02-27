//
//  SwiftDataProductRepository.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 26/02/2024.
//

import Foundation
import SwiftData

class SwiftDataProductRepository: LocalRepository {
    
    let provider: SwiftDataProvider = SwiftDataProvider.shared
    
    @MainActor
    func fetch() async throws -> [Product] {
        let products: [SwiftDataProvider.Product] = try provider.modelContainer.mainContext.fetch(FetchDescriptor<SwiftDataProvider.Product>())
        return products.map { product in
            return Product.convert(model: product)
        }
    }
    
    @MainActor
    func save(items: [Product]) async throws {
        for item in items {
            let product = item.convertToSwiftDataModel()
            provider.modelContainer.mainContext.insert(product)
        }
        try provider.modelContainer.mainContext.save()
    }
}
