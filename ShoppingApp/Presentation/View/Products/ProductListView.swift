//
//  ProductListView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

struct ProductListView: View {
    @State var viewModel: ViewModel
    
    var body: some View {
        
        NavigationStack {
            grid.navigationDestination(for: ProductItemViewModel.self) { item in
                    ProductDetailView(item: item)
                        .navigationTitle("Product detail")
                }
                .navigationTitle("Products")
                .alert(viewModel.errorMessage, isPresented: $viewModel.showErrorMessage, actions: {
                    Button {
                        viewModel.showErrorMessage.toggle()
                    } label: {
                        Text("OK")
                    }
                })
                .task {
                    await viewModel.fetchProducts()
                }
        }
        
    }
    
    var grid: some View {
#if os(visionOS)
        ProductListVisionView(items: viewModel.items)
#else
        ProductListIOSView(items: viewModel.items)
#endif
    }
}
#Preview {
    struct PreviewGetProductsUseCase: GetProductsUseCaseProtocol {
        func execute() async -> Result<[Product], Error> {
            return .success(Product.sampleData)
        }
    }
    return ProductListView(viewModel: ProductListView.ViewModel(getProductsUseCase: PreviewGetProductsUseCase(),
                                                                getLocalProductsUseCase: PreviewGetProductsUseCase(),
                                                                currentCurrency: Currency.gbp))
}

