//
//  ProductionListViewModel.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import Foundation

extension ProductListView {
    @MainActor
    @Observable
    class ViewModel {
        var items: [ProductItemViewModel] = []
        
        let service: ProductListService
        
        init(service: ProductListService) {
            self.service = service
        }
        
        func fetchProducts() async {
            do {
                self.items = try await service.fetchProducts()
                
            } catch {
                print("Unexpected error: \(error).")
            }
        }
    }
}
