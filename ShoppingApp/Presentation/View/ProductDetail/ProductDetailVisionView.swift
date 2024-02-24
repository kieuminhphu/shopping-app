//
//  ProductDetailVisionView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

struct ProductDetailVisionView: View {
    var item: ProductItemViewModel
    var body: some View {
            ZStack {
                HStack {
                    ScrollView {
                        VStack {
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.largeTitle)
                                Text(item.price)
                                    .fontWeight(.bold)
                                Text(item.description)
                                    .font(.subheadline)
                                Spacer()
                            }
                        }
                        .padding()
                    }
                    
                    ZStack {
                        Color.white
                        Image(item.image ?? "")
                            .resizable()
                    }
                }
            }
            .toolbar {
                Button(action: {}, label: {
                    Text("Preview in your space")
                })
        }
    }
}

#Preview {
    ProductDetailVisionView(item: ProductItemViewModel.sampleData[0])
}
