//
//  ProductionListView+Configuration.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 23/02/2024.
//

import SwiftUI

protocol ProductListConfigurable {
    var minimumWidthOfCell: CGFloat { get }
    var cardBackgroundColor: Color? { get }
}

struct ProductionListConfiguration: ProductListConfigurable {
    var minimumWidthOfCell: CGFloat = 130
    var cardBackgroundColor: Color? = Color.white
}

struct ProductionListVisionConfiguration: ProductListConfigurable {
    var minimumWidthOfCell: CGFloat = 250
    var cardBackgroundColor: Color? = Color.white.opacity(0.3)
}

extension ProductListView {
    var configuration: ProductListConfigurable {
#if os(visionOS)
        return ProductionListVisionConfiguration()
#else
        return ProductionListConfiguration()
#endif
    }
}
