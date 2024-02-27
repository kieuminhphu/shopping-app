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
        var errorMessage: String = ""
        var showErrorMessage: Bool = false
        
        let currentCurrency: Currency
        let getProductsUseCase: GetProductsUseCaseProtocol
        let getLocalProductsUseCase: GetProductsUseCaseProtocol
        
        init(getProductsUseCase: GetProductsUseCaseProtocol,
             getLocalProductsUseCase: GetProductsUseCaseProtocol,
             currentCurrency: Currency) {
            self.getProductsUseCase = getProductsUseCase
            self.getLocalProductsUseCase = getLocalProductsUseCase
            self.currentCurrency = currentCurrency
        }
        
        func fetchProducts() async {
            await fetchLocalProducts()
            await fetchRemoteProducts()
        }
        
        private func fetchRemoteProducts() async {
            let result = await getProductsUseCase.execute()
            switch result {
            case .success(let products):
                self.items = convertToItems(products: products)
            case .failure(let error):
                errorMessage = error.localizedDescription
                showErrorMessage.toggle()
            }
        }
        
        private func fetchLocalProducts() async {
            let result = await getLocalProductsUseCase.execute()
            switch result {
            case .success(let products):
                self.items = convertToItems(products: products)
            default:
                break
            }
        }
        
        private func convertToItems(products: [Product]) -> [ProductItemViewModel] {
            return products.map { product in
                let convertedPrice = PriceConverter(price: product.price).convertTo(currency: currentCurrency)
                let formatedPrice = PriceFormatter(price: convertedPrice).priceDisplay()
                return ProductItemViewModel(id: product.id,
                                            name: product.name,
                                            description: product.description,
                                            image: product.image,
                                            modelName: product.modelName,
                                            price: formatedPrice)}
        }
    }
}
