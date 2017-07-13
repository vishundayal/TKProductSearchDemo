//
//  SelectShopTypeViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Tokopedia. All rights reserved.
//

import UIKit

class SelectShopTypeViewController: UIViewController {

    weak var tableViewController: ShopTypesTableViewController!
    var selectedShopTypes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewController()
    }
    
    //    MARK:- Private
    private func setupTableViewController() {
        for item in self.childViewControllers {
            if item is ShopTypesTableViewController {
                self.tableViewController = item as! ShopTypesTableViewController
            }
        }
        self.tableViewController.selectedShopTypes = self.selectedShopTypes
    }
    
    //    MARK:- Actions
    @IBAction func cancelButtonTapped(sender:UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonTapped(sender:UIBarButtonItem) {
//        self.productFilter = ProductFilter()
    }
    
    @IBAction func applyButtonTapped(sender:UIButton) {
        
    }
}
