//
//  ProductListIOSView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 25/02/2024.
//

import SwiftUI

struct ProductListIOSView: View {
    var items: [ProductItemViewModel]
    var body: some View {
        ScrollView {
            let columns =
            [GridItem(.flexible()),
             GridItem(.flexible()),]
            LazyVGrid(columns: columns,
                      spacing: 16) {
                ForEach(items) { item in
                    NavigationLink(value: item) {
                        ProductItemView(item: item)
                            .background(Color.white)
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
    ProductListIOSView(items: ProductItemViewModel.sampleData)
}
