//
//  ProductDetailIOSView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

struct ProductDetailIOSView: View {
    var item: ProductItemViewModel
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Color.white
                    Image(item.image)
                        .resizable()
                        .frame(width: 350)
                }.frame(height: 350)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text(item.name)
                            .font(.largeTitle)
                        Text(item.price)
                            .fontWeight(.bold)
                        Spacer(minLength: 16)
                        Text(item.description)
                            .font(.subheadline)
                        
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProductDetailIOSView(item: ProductItemViewModel.sampleData[0])
}
