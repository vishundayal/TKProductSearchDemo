//
//  ProductsListViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {

    var productDataBuilder: ProductSearchBuilder!
    weak var collectionViewController: ProductListCollectionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionViewController()
    }
    
//    MARK:- Private
    func setupCollectionViewController() {
        for item in self.childViewControllers {
            if item is ProductListCollectionViewController {
                self.collectionViewController = item as! ProductListCollectionViewController
            }
        }
        self.collectionViewController.productList = productDataBuilder.productsList
    }
    
//    MARK:- Actions
    
    @IBAction func filterButtonTapped(sender:UIButton) {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "ProductFilterNavigationController")
        self.present(navigationController!, animated: true, completion: nil)
    }
}
