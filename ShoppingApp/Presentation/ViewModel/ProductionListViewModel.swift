//
//  ProductionListViewModel.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import Foundation

extension ProductListView {
    @Observable
    class ViewModel {
        var items: [ProductItemViewModel] = []
        var errorMessage: String?
        
        let currentCurrency: Currency
        let getProductsUserCase: GetProductsUserCaseProtocol
        
        init(getProductsUserCase: GetProductsUserCaseProtocol,
             currentCurrency: Currency) {
            self.getProductsUserCase = getProductsUserCase
            self.currentCurrency = currentCurrency
        }
        
        func fetchProducts() async throws {
            let result = try await getProductsUserCase.execute()
            switch result {
            case .success(let products):
                self.items = products.map { product in
                    let convertedPrice = PriceConverter(price: product.price).convertTo(currency: currentCurrency)
                    let formatedPrice = PriceFormatter(price: convertedPrice).priceDisplay()
                    return ProductItemViewModel(id: product.id,
                                                name: product.name,
                                                description: product.description,
                                                image: product.image,
                                                modelName: product.modelName,
                                                price: formatedPrice)}
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}
