//
//  GetProductsUserCase.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 25/02/2024.
//

import Foundation

protocol GetProductsUserCaseProtocol {
    func execute() async throws -> Result<[Product], Error>
}

struct GetProductsUserCase: GetProductsUserCaseProtocol {
    let repository: ProductRepository
    
    func execute() async throws -> Result<[Product], Error> {
        do {
            let products = try await repository.fetchProducts()
            return .success(products)
        } catch {
            return .failure(error)
        }
    }
}
