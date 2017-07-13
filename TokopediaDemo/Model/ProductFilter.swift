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
    
    init() {
        let allTypes = ShopTypeDataManager().loadData()
        for item in allTypes {
            self.shopTypes.append(item.shopTypeKey)
        }
    }
    
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
    
    func copy() -> ProductFilter {
        let newObject = ProductFilter()
        newObject.minPrice = self.minPrice
        newObject.maxPrice = self.maxPrice
        newObject.isWholeSale = self.isWholeSale
        newObject.shopTypes = []
        newObject.shopTypes.append(contentsOf: self.shopTypes)
        return newObject
    }
}
