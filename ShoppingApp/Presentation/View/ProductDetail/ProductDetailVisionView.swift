//
//  ProductDetailVisionView.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

struct ProductDetailVisionView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @State var isPreviewShowing: Bool = false

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
                        Image(item.image)
                            .resizable()
                    }
                }
            }
            .onDisappear(perform: {
                dismissPreview()
            })
            .toolbar {
                Toggle("Preview in your space", isOn: $isPreviewShowing)
                    .onChange(of: isPreviewShowing) { _, isPreviewShowing in
                        if isPreviewShowing {
                            openPreview(value: item.modelName)
                        } else {
                            dismissPreview()
                        }
                    }
                    .toggleStyle(.button)
        }
    }
    
    private func openPreview(value: String) {
        openWindow(id: "Product", value: value)
    }
    
    private func dismissPreview() {
        dismissWindow(id: "Product")
    }
}

#Preview {
    ProductDetailVisionView(item: ProductItemViewModel.sampleData[0])
}
