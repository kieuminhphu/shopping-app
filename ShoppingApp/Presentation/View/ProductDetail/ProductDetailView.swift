//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import SwiftUI

struct ProductDetailView: View {
    var item: ProductItemViewModel
    var body: some View {
#if os(visionOS)
        return ProductDetailVisionView(item: item)
#else
        return ProductDetailIOSView(item: item)
#endif
    }
}

#Preview {
    ProductDetailView(item: ProductItemViewModel.sampleData[0])
}
