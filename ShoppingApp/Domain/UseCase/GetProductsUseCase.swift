//
//  GetProductsUseCase.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 25/02/2024.
//

import Foundation

protocol GetProductsUseCaseProtocol {
    func execute() async -> Result<[Product], Error>
}

struct GetRemoteProductsUseCase<Local: LocalRepository>: GetProductsUseCaseProtocol where Local.DomainModel == Product {
    let repository: ProductRepository
    let localRepository: Local
    
    func execute() async -> Result<[Product], Error> {
        do {
            let products = try await repository.fetchProducts()
            try await localRepository.save(items: products)
            return .success(products)
        } catch {
            return .failure(error)
        }
    }
}

struct GetLocalProducsUseCase<Local: LocalRepository>: GetProductsUseCaseProtocol where Local.DomainModel == Product {
    let repository: Local
    
    func execute() async -> Result<[Product], Error> {
        do {
            let products = try await repository.fetch()
            return .success(products)
        } catch {
            return .failure(error)
        }
    }
}
