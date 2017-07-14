//
//  SelectShopTypeViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

class SelectShopTypeViewController: UIViewController {

    var tableViewController: ShopTypesTableViewController!
    var applyButtonHandler: ((_ shopTypes:[String])->Void)?
    var selectedShopTypes: [String] = []
    
//    MARK:- lifecycle
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
        self.tableViewController.selectedShopTypes.removeAll()
        self.tableViewController.tableView.reloadData()
    }
    
    @IBAction func applyButtonTapped(sender:UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
        if self.applyButtonHandler != nil {
            self.applyButtonHandler!(self.tableViewController.selectedShopTypes)
        }
    }
}
