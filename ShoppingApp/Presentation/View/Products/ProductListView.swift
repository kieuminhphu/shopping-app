//
//  ProductListView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI


protocol ProductListService {
    func fetchProducts() async throws -> [ProductItemViewModel]
}

struct ProductAPIItemViewModelApdater: ProductListService {
    func fetchProducts() async throws -> [ProductItemViewModel] {
        return ProductItemViewModel.sampleData
    }
}

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
                await viewModel.fetchProducts()
            }
        }
    }
}

#Preview {
    struct PreviewProductListService: ProductListService {
        func fetchProducts() async throws -> [ProductItemViewModel] {
            return ProductItemViewModel.sampleData
        }
    }
    return ProductListView(viewModel: ProductListView.ViewModel(service: PreviewProductListService()))
}

