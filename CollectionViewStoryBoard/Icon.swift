//
//  Icon.swift
//  CollectionViewStoryBoard
//
//  Created by Yurii on 2021/2/14.
//

import Foundation
import UIKit

struct Icon {
    var name: String
    var price: Double
    var isFeatured: Bool

    init(name: String, price: Double,  isFeatured: Bool) {
        self.name = name
        self.price = price
        self.isFeatured = isFeatured
    }
}
