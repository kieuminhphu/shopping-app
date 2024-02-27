//
//  GetRemoteProductsUseCaseTests.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import XCTest
@testable import ShoppingApp

final class GetRemoteProductsUseCaseTests: XCTestCase {
    
    var sut: GetProductsUseCaseProtocol!
    
    func testFetchRemoteProductSuccess_SaveLocalSuccess() async {
        // We set the result of local is success with empty data because in GetRemoteProductsUseCase use save function
        sut = GetRemoteProductsUseCase(repository: MockRemoteProductRepository(result: .success(data: Product.sampleData)),
                                       localRepository: MockLocalProductRepository(result: .success(data: [])))
        
        let result = await sut.execute()
        
        switch result {
            case .failure(let error):
                XCTFail("Expected to be a success but got a failure with \(error)")
            case .success(let value):
                XCTAssertEqual(value, Product.sampleData)
        }
    }
    
    func testFetchRemoteProductSuccess_SaveLocalFailure() async {
        sut = GetRemoteProductsUseCase(repository: MockRemoteProductRepository(result: .success(data: Product.sampleData)),
                                       localRepository: MockLocalProductRepository(result: .failure(error: MockError.localProductError)))
        
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
    
    func testFetchRemoteProductFailed_SaveLocalSuccess() async {
        sut = GetRemoteProductsUseCase(repository: MockRemoteProductRepository(result: .failure(error: MockError.remoteProductError)),
                                       localRepository: MockLocalProductRepository(result: .success(data: Product.sampleData)))
        
        let result = await sut.execute()
        
        switch result {
            case .failure(let error):
                guard let mockError = error as? MockError else {
                    return XCTFail("Expected to be a error is mockError")
                }
                XCTAssertEqual(mockError, MockError.remoteProductError)
            case .success:
                XCTFail("Expected to be a error")
        }
    }
    
    func testFetchRemoteProductFailed_SaveLocalFailure() async {
        sut = GetRemoteProductsUseCase(repository: MockRemoteProductRepository(result: .failure(error: MockError.remoteProductError)),
                                       localRepository: MockLocalProductRepository(result: .failure(error: MockError.localProductError)))
        
        let result = await sut.execute()
        
        switch result {
            case .failure(let error):
                guard let mockError = error as? MockError else {
                    return XCTFail("Expected to be a error is mockError")
                }
                XCTAssertEqual(mockError, MockError.remoteProductError)
            case .success:
                XCTFail("Expected to be a error")
        }
    }
}

