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
            ScrollView {
                let columns = [GridItem(.adaptive(minimum: configuration.minimumWidthOfCell))]
                LazyVGrid(columns: columns,
                          spacing: 16) {
                    ForEach(viewModel.items) { item in
                        NavigationLink(value: item) {
                            ProductItemView(item: item)
                                .background(configuration.cardBackgroundColor)
                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
                                
                        }
                        .buttonStyle(.plain)
                    }
                }
                          .padding()
                        
            }
            .navigationDestination(for: ProductItemViewModel.self) { item in
                ProductDetailView(item: item)
                    .navigationTitle("Product detail")
            }
            .navigationTitle("Products")
            .task {
                try? await viewModel.fetchProducts()
            }
        }
    }
}

#Preview {
    struct PreviewGetProductsUserCase: GetProductsUserCaseProtocol {
        func execute() async throws -> Result<[Product], Error> {
            return Result.success(Product.sampleData)
        }
    }
    return ProductListView(viewModel: ProductListView.ViewModel(getProductsUserCase: PreviewGetProductsUserCase(),
                                                                currentCurrency: Currency.gpb))
}

