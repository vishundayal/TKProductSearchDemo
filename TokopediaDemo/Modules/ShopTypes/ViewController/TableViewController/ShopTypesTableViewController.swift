//
//  ShopTypesTableViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

class ShopTypesTableViewController: UITableViewController {

    var allShopTypes: [ShopType] = []
    var selectedShopTypes: [String] = []
    
//    MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.allShopTypes = ShopTypeDataManager().loadData()
        self.tableView.removeUnusedBottomLines()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allShopTypes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let type = self.allShopTypes[indexPath.row]
        cell.textLabel?.text = type.displayText
        if self.selectedShopTypes.contains(type.shopTypeKey) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
//    MARK:- Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let type = self.allShopTypes[indexPath.row]
        let index = self.selectedShopTypes.index(of: type.shopTypeKey)
        if index == nil {
            self.selectedShopTypes.append(type.shopTypeKey)
            cell?.accessoryType = .checkmark
        } else {
            self.selectedShopTypes.remove(at: index!)
            cell?.accessoryType = .none
        }
    }
}
