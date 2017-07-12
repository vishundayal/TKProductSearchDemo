//
//  Product.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class Product {
    var id: UInt64!
    var name: String!
    var uri: String?
    var image_uri: String?
    var image_uri_700: String?
    var price: String?
    
    init(dict:[String:Any]) {
        self.id = dict["id"] as! UInt64
        self.name = dict["name"] as! String
        self.uri = dict["uri"] as? String
        self.image_uri = dict["image_uri"] as? String
        self.image_uri_700 = dict["image_uri_700"] as? String
        self.price = dict["price"] as? String
    }
}
