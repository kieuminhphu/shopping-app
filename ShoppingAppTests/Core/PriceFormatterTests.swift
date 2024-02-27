//
//  PriceFormatterTests.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import XCTest
@testable import ShoppingApp

final class PriceFormatterTests: XCTestCase {
    var sut: PriceFormatter!
    
    func testUSDDisplay() {
        sut = PriceFormatter(price: Price(value: 123, currency: .usd))
        let value = sut.priceDisplay()
        XCTAssertEqual(value, "123$")
    }
    
    func testDisplay() {
        sut = PriceFormatter(price: Price(value: 123, currency: .gbp))
        let value = sut.priceDisplay()
        XCTAssertEqual(value, "123£")
    }
    
    func testEuroDisplay() {
        sut = PriceFormatter(price: Price(value: 123, currency: .euro))
        let value = sut.priceDisplay()
        XCTAssertEqual(value, "123€")
    }
}
