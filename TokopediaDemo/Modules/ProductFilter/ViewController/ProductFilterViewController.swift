//
//  ProductFilterViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

class ProductFilterViewController: UIViewController {

    var productFilter = ProductFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    MARK:- Actions
    @IBAction func cancelButtonTapped(sender:UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func resetButtonTapped(sender:UIBarButtonItem) {
        self.productFilter = ProductFilter()
    }
}
