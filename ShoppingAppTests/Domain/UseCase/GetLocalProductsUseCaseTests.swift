//
//  GetLocalProductsUseCase.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import XCTest
@testable import ShoppingApp

final class GetLocalProductsUseCaseTests: XCTestCase {
    var sut: GetProductsUseCaseProtocol!
    
    func testFetchLocalProductsSuccess() async {
        sut = GetLocalProducsUseCase(repository: MockLocalProductRepository(result: .success(data: Product.sampleData)))
        
        let result = await sut.execute()
        
        switch result {
            case .failure(let error):
                XCTFail("Expected to be a success but got a failure with \(error)")
            case .success(let value):
                XCTAssertEqual(value, Product.sampleData)
        }
    }
    
    func testFetchLocalProductsFailure() async {
        sut = GetLocalProducsUseCase(repository: MockLocalProductRepository(result: .failure(error: MockError.localProductError)))
        
        let result = await sut.execute()
        
        switch result {
            case .failure(let error):
                guard let mockError = error as? MockError else {
                    return XCTFail("Expected to be a error is mockError")
                }
                XCTAssertEqual(mockError, MockError.localProductError)
            case .success:
                XCTFail("Expected to be a error")
        }
    }
}
