//
//  ProductListVisionView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 25/02/2024.
//

import SwiftUI
import SwiftData

struct ProductListVisionView: View {
    
    var items: [ProductItemViewModel]
    var body: some View {
        ScrollView {
            let columns =
            [GridItem(.adaptive(minimum: 250)),
             GridItem(.adaptive(minimum: 250)),]
            LazyVGrid(columns: columns,
                      spacing: 16) {
                ForEach(items) { item in
                    NavigationLink(value: item) {
                        ProductItemView(item: item)
                            .background(Color.white.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 16.0))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
                        
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
    }
}

#Preview {
    ProductListVisionView(items: ProductItemViewModel.sampleData)
}
