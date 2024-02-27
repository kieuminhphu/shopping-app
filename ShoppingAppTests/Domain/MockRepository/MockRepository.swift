//
//  MockRepository.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import Foundation
@testable import ShoppingApp

enum MockError: Error, Equatable {
    case remoteProductError
    case localProductError
}

enum MockResult<T> {
    case success(data: [T])
    case failure(error: MockError)
}

struct MockRemoteProductRepository: ProductRepository {
    let result: MockResult<Product>
    
    func fetchProducts() async throws -> [Product] {
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}

struct MockLocalProductRepository: LocalRepository {
    let result: MockResult<Product>
    
    func fetch() async throws -> [Product] {
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
    func save(items: [Product]) async throws {
        switch result {
        case .failure(let error):
            throw error
        default:
            break
        }
    }
}
