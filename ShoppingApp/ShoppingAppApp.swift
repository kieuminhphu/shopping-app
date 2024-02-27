//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    
    var body: some Scene {
        WindowGroup(id: "Window") {
            // We will use DIContainer to handle DI in the future
            ProductListView(viewModel: ProductListView.ViewModel(getProductsUseCase: GetRemoteProductsUseCase(repository: JSONProductRepository(),
                                                                                                              localRepository: SwiftDataProductRepository()),
                                                                 getLocalProductsUseCase: GetLocalProducsUseCase(repository: SwiftDataProductRepository()),
                                                                 currentCurrency: Currency.gbp))
        }
        
#if os(visionOS)
        WindowGroup(id: "Product", for: String.self) { name in
            ProductEntityView(entityName: name.wrappedValue ?? "")
        }
        .windowStyle(.volumetric)
#endif
    }
}
