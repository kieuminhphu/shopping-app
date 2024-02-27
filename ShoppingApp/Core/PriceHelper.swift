//
//  PriceHelper.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 27/02/2024.
//

import Foundation

struct PriceFormatter {
    let price: Price
    
    func priceDisplay() -> String {
        return "\(price.value)\(symbol(currency: price.currency))"
    }
    
    private func symbol(currency: Currency) -> String {
        switch currency {
        case .usd:
            return "$"
        case .gbp:
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
        case .gbp:
            return 1.27
        case .euro:
            return 1.08
        }
    }
}
