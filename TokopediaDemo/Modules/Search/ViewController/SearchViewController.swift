//
//  SearchViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 11/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let productDataBuilder = ProductSearchBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
//    MARK:- Private
    func setupUI() {
        self.textField.roundedCorner(radius: 7.0)
        self.searchButton.roundedCorner(radius: 7.0)
    }
    
//    MARK:- Actions
    @IBAction func searchButtonTapped(sender:UIButton) {
        if self.textField.text == nil {
            return
        }
        self.productDataBuilder.searchText = self.textField.text
        self.productDataBuilder.prepareForFreshLoad()
        self.productDataBuilder.loadProducts { (error:Error?) in
            if error == nil {
                DispatchQueue.main.async {
                    self.showProductsList()
                }
            }
        }
    }
    
    func showProductsList() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductsListViewController") as! ProductsListViewController
        viewController.productDataBuilder = self.productDataBuilder
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
