//
//  ProductFilter.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class ProductFilter {
    var minPrice: Int = MIN_Price
    var maxPrice: Int = MAX_Price
    var isWholeSale = false
    var shopTypes: [String] = []
    
    func isWholeSaleStringValue()->String {
        return (self.isWholeSale == true) ? "true" : "false"
    }
    
    func minPriceStringValue() -> String {
        let formatter = TPNumberFormatter().currencyFormatter(fractionLength: 0)
        return formatter.string(from: NSNumber(value:self.minPrice))!
    }
    
    func maxPriceStringValue() -> String {
        let formatter = TPNumberFormatter().currencyFormatter(fractionLength: 0)
        return formatter.string(from: NSNumber(value:self.maxPrice))!
    }

}
