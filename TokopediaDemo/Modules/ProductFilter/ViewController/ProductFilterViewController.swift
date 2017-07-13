//
//  ProductFilterViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

class ProductFilterViewController: UIViewController {

    weak var productFilter: ProductFilter!
    weak var tableViewController: ProductFilterTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewController()
    }
    
    //    MARK:- Private
    private func setupTableViewController() {
        for item in self.childViewControllers {
            if item is ProductFilterTableViewController {
                self.tableViewController = item as! ProductFilterTableViewController
            }
        }
        self.tableViewController.productFilter = self.productFilter
    }

//    MARK:- Actions
    @IBAction func cancelButtonTapped(sender:UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func resetButtonTapped(sender:UIBarButtonItem) {
        self.productFilter = ProductFilter()
    }
}
