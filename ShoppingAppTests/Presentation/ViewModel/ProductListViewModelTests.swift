//
//  ProductListViewModel.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import XCTest
@testable import ShoppingApp

final class ProductListViewModelTests: XCTestCase {
    var sut: ProductListView.ViewModel!
    var items: [ProductItemViewModel]!
    var products: [Product]!
    var baseCurrency: Currency!
    
    override func setUp() {
        products = [Product(id: "1",
                            name: "product 1",
                            description: "description 1",
                            image: "image 1",
                            modelName: "model name 1",
                            price: Price(value: 123, currency: .gbp)),
                    Product(id: "2",
                                        name: "product 2",
                                        description: "description 2",
                                        image: "image 2",
                                        modelName: "model name 2",
                                        price: Price(value: 123, currency: .usd)),
                    Product(id: "3",
                                        name: "product 3",
                                        description: "description 3",
                                        image: "image 3",
                                        modelName: "model name 3",
                                        price: Price(value: 123, currency: .euro))]
        
        items = [ProductItemViewModel(id: "1",
                                      name: "product 1",
                                      description: "description 1",
                                      image: "image 1",
                                      modelName: "model name 1",
                                      price: "156$"),
                 ProductItemViewModel(id: "2",
                                               name: "product 2",
                                               description: "description 2",
                                               image: "image 2",
                                               modelName: "model name 2",
                                               price: "123$"),
                 ProductItemViewModel(id: "3",
                                               name: "product 3",
                                               description: "description 3",
                                               image: "image 3",
                                               modelName: "model name 3",
                                               price: "132$")]
        
        baseCurrency = .usd
    }
    
    func testFetchProducts_LocalDataIsEmptyAndRemoteDataIsNotEmpty_UpdateItemsByRemoteData() async {
        sut = ProductListView.ViewModel(getProductsUseCase: MockGetProductUseCase(result: .success(products)),
                                        getLocalProductsUseCase: MockGetProductUseCase(result: .success([])),
                                        currentCurrency: baseCurrency)
        await sut.fetchProducts()
        
        XCTAssertEqual(sut.items, items)
        XCTAssertFalse(sut.showErrorMessage)
        XCTAssertEqual(sut.errorMessage, "")
    }
    
    func testFetchProducts_LocalDataIsNotEmptyAndRemoteDataIsEmpty_UpdateItemsIsEmpty() async {
        sut = ProductListView.ViewModel(getProductsUseCase: MockGetProductUseCase(result: .success([])),
                                        getLocalProductsUseCase: MockGetProductUseCase(result: .success(products)),
                                        currentCurrency: baseCurrency)
        await sut.fetchProducts()
        
        XCTAssertEqual(sut.items, [])
        XCTAssertFalse(sut.showErrorMessage)
        XCTAssertEqual(sut.errorMessage, "")
    }
    
    func testFetchProducts_FetchLocalFailedAndFetchRemoteSuccess_DoNotShowErrorMessage() async {
        sut = ProductListView.ViewModel(getProductsUseCase: MockGetProductUseCase(result: .success(products)),
                                        getLocalProductsUseCase: MockGetProductUseCase(result: .failure(MockError.localProductError)),
                                        currentCurrency: baseCurrency)
        await sut.fetchProducts()
        
        XCTAssertEqual(sut.items, items)
        XCTAssertFalse(sut.showErrorMessage)
        XCTAssertEqual(sut.errorMessage, "")
    }
    
    func testFetchProducts_FetchLocalSuccessAndFetchRemoteError_UpdateItemsByLocalDataAndShowErrorMessage() async {
        sut = ProductListView.ViewModel(getProductsUseCase: MockGetProductUseCase(result: .failure(MockError.remoteProductError)),
                                        getLocalProductsUseCase: MockGetProductUseCase(result: .success(products)),
                                        currentCurrency: baseCurrency)
        await sut.fetchProducts()
        
        XCTAssertEqual(sut.items, items)
        XCTAssertTrue(sut.showErrorMessage)
        XCTAssertEqual(sut.errorMessage, MockError.remoteProductError.localizedDescription)
    }
    
}
