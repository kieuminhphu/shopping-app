//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(viewModel: ProductListView.ViewModel(service: ProductAPIItemViewModelApdater()))
        }
    }
}
