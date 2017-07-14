//
//  ShopType.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class ShopType {
    var shopTypeKey: String!
    var displayText: String!
    
    init(dict:[String:String]) {
        self.shopTypeKey = dict["shopTypeKey"]
        self.displayText = dict["displayText"]
    }
}
