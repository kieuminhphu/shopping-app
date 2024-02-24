//
//  Price.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

enum Currency: String {
    case usd = "USD"
    case gpb = "GPB"
    case euro = "EURO"
}

struct Price {
    let value: Int
    let currency: Currency
}

struct PriceFormatter {
    let price: Price
    
    func priceDisplay() -> String {
        return "\(price.value)\(symbol(currency: price.currency))"
    }
    
    private func symbol(currency: Currency) -> String {
        switch currency {
        case .usd:
            return "$"
        case .gpb:
            return "£"
        case .euro:
            return "€"
        }
    }
}

struct PriceConverter {
    let price: Price
    
    func convertTo(currency: Currency) -> Price {
        let scale = (baseValue(currency: price.currency) / baseValue(currency: currency))
        let newValue = Int(Double(price.value) * scale)
        return Price(value: newValue, currency: currency)
    }
    
    private func baseValue(currency: Currency) -> Double {
        switch currency {
        case .usd:
            return 1
        case .gpb:
            return 1.27
        case .euro:
            return 1.08
        }
    }
}
