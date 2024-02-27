//
//  SwiftDataProvider.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 26/02/2024.
//

import SwiftData

// SwiftData don't support on visionOS platform
struct SwiftDataProvider {
    static let shared = SwiftDataProvider(isStoredInMemoryOnly: false)
    
    public let modelContainer: ModelContainer
    
    public init(isStoredInMemoryOnly: Bool) {
        let modelConfiguration = ModelConfiguration(
            isStoredInMemoryOnly: isStoredInMemoryOnly
        )
        modelContainer = try! ModelContainer(
            for: SwiftDataProvider.Product.self,
            configurations: modelConfiguration
        )
    }
}
