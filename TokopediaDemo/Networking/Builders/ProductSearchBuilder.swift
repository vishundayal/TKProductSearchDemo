//
//  ProductSearchBuilder.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class ProductSearchBuilder {
    
    var searchText: String?
    var filter: ProductFilter = ProductFilter()
    var startPage = -1
    let pageSize = 10
    var productsList: [Product] = []
    
    func loadProducts(completionHandler: @escaping(_ error: Error?) -> Swift.Void) {
        if self.searchText == nil {
            return
        }
        var params: [String:String] = ["q":self.searchText!]
        params["pmin"] = String(format: "%d", self.filter.minPrice)
        params["pmax"] = String(format: "%d", self.filter.maxPrice)
        params["wholesale"] = self.filter.isWholeSaleStringValue()
        if self.filter.shopTypes.contains("official") == true {
            params["official"] = "true"
        }
        if self.filter.shopTypes.contains("fshop") == true {
            params["fshop"] = "2"
        }
        params["start"] = String(format: "%d", self.startPage+1)
        params["rows"] = String(format: "%d", self.pageSize)
        ProductSearchService().searchProductsWith(params: params) { (response:[String : Any]?, error:Error?) in
            if error == nil && response != nil {
                self.startPage += 1
                let status = response!["status"] as! [String:Any]
                let error_code = status["error_code"] as! Int
                if error_code == 0 {
                    self.getProducts(response: response!)
                }
                completionHandler(nil)
            } else {
                debugPrint(error!.localizedDescription)
                completionHandler(error)
            }
        }
    }
    
    func getProducts(response:[String:Any]) {
        let data = response["data"] as! [[String:Any]]
        var list: [Product] = []
        for p in data {
            let product = Product(dict: p)
            list.append(product)
        }
        self.productsList.append(contentsOf: list)
    }
    
    func prepareForFreshLoad() {
        self.startPage = -1
        self.productsList.removeAll()
    }
}
