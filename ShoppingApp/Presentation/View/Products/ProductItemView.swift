//
//  ProductItemView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

struct ProductItemView: View {
    var item: ProductItemViewModel
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.white
                Image(item.image)
                    .scaledToFit()
            }
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .lineLimit(2)
                Text(item.price)
                    .fontWeight(.bold)
            }
            .padding()
        }
    }
}

#Preview {
    ProductItemView(item: ProductItemViewModel.sampleData[0])
        .previewLayout(.sizeThatFits)
}
