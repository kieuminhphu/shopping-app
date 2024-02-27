//
//  Price.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

enum Currency: String, Equatable {
    case usd = "USD"
    case gbp = "GBP"
    case euro = "EURO"
}

struct Price: Equatable {
    let value: Int
    let currency: Currency
}
