//
//  JSONClient.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 24/02/2024.
//

import Foundation

enum JSONError: Error {
    case fileNotFound
}

struct JSONClient {
    func getData<T: Codable>(name: String) throws -> [T] {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            // Decoding the Product type from JSON data using JSONDecoder() class.
            let model = try JSONDecoder().decode([T].self, from: jsonData)
            return model
        } 
        else {
            throw JSONError.fileNotFound
        }
    }
}
