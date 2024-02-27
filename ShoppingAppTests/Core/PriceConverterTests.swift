//
//  PriceConverterTests.swift
//  ShoppingAppTests
//
//  Created by Kieu Phu on 27/02/2024.
//

import Foundation

import XCTest
@testable import ShoppingApp

final class PriceConverterTests: XCTestCase {
    var sut: PriceConverter!
    
    func testConvertFromUSD_ToGBP() {
        sut = PriceConverter(price: Price(value: 123, currency: .usd))
        let value = sut.convertTo(currency: .gbp)
        XCTAssertEqual(value, Price(value: 96, currency: .gbp))
    }
    
    func testConvertFromUSD_ToEuro() {
        sut = PriceConverter(price: Price(value: 123, currency: .usd))
        let value = sut.convertTo(currency: .euro)
        XCTAssertEqual(value, Price(value: 113, currency: .euro))
    }
    
    func testConvertFromGBP_ToUSD() {
        sut = PriceConverter(price: Price(value: 123, currency: .gbp))
        let value = sut.convertTo(currency: .usd)
        XCTAssertEqual(value, Price(value: 156, currency: .usd))
    }
    
    func testConvertFromGBP_ToEuro() {
        sut = PriceConverter(price: Price(value: 123, currency: .gbp))
        let value = sut.convertTo(currency: .euro)
        XCTAssertEqual(value, Price(value: 144, currency: .euro))
    }
    
    func testConvertFromEuro_ToUSD() {
        sut = PriceConverter(price: Price(value: 123, currency: .euro))
        let value = sut.convertTo(currency: .usd)
        XCTAssertEqual(value, Price(value: 132, currency: .usd))
    }
    
    func testConvertFromGBP_ToGBP() {
        sut = PriceConverter(price: Price(value: 123, currency: .euro))
        let value = sut.convertTo(currency: .gbp)
        XCTAssertEqual(value, Price(value: 104, currency: .gbp))
    }
}
