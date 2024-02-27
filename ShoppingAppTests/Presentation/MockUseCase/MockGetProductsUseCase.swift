//
//  MockGetProductsUseCase.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import Foundation
@testable import ShoppingApp

struct MockGetProductUseCase: GetProductsUseCaseProtocol {
    let result: Result<[Product], Error>
    func execute() async -> Result<[Product], Error> {
        return result
    }
}
