//
//  ShopTypeDataManager.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class ShopTypeDataManager {
    
    func loadData() -> [ShopType] {
        let path = Bundle.main.path(forResource: "ShopTypes.plist", ofType: nil)
        let fileUrl = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: fileUrl)
            let contentList = try PropertyListSerialization.propertyList(from: data, options: PropertyListSerialization.ReadOptions.mutableContainers, format: nil) as! [[String:String]]
            var list: [ShopType] = []
            for item in contentList {
                let type = ShopType(dict: item)
                list.append(type)
            }
            return list

        } catch  {
            
        }
        return []
    }
}
