//
//  ProductsListViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit
import Toast_Swift

class ProductsListViewController: UIViewController {

    var productDataBuilder: ProductSearchBuilder!
    weak var collectionViewController: ProductListCollectionViewController!
    var isLoadingPage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionViewController()
    }
    
    func loadNexPage() {
        if self.isLoadingPage == true {
            return
        }
        self.isLoadingPage = true
        self.productDataBuilder.loadProducts { (error:Error?) in
            if error == nil {
                DispatchQueue.main.async {
                    self.collectionViewController.productList = self.productDataBuilder.productsList
                    self.collectionViewController.collectionView?.reloadData()
                }
                self.isLoadingPage = false
            }
        }
    }

//    MARK:- Private
    private func setupCollectionViewController() {
        for item in self.childViewControllers {
            if item is ProductListCollectionViewController {
                self.collectionViewController = item as! ProductListCollectionViewController
            }
        }
        self.collectionViewController.productList = self.productDataBuilder.productsList
    }
    
    private func productFilterUpdated() {
        self.view.makeToastActivity(.center)
        self.productDataBuilder.prepareForFreshLoad()
        self.productDataBuilder.loadProducts { (error:Error?) in
            if error == nil {
                DispatchQueue.main.async {
                    self.collectionViewController.productList = self.productDataBuilder.productsList
                    self.collectionViewController.collectionView?.reloadData()
                    self.view.hideToastActivity()
                }
            }
        }
    }
    
//    MARK:- Actions
    
    @IBAction func filterButtonTapped(sender:UIButton) {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "ProductFilterNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! ProductFilterViewController
        viewController.productFilter = self.productDataBuilder.filter.copy()
        viewController.applyButtonHandler = {(filter:ProductFilter)->Void in
            self.productDataBuilder.filter = filter
            self.productFilterUpdated()
        }
        self.present(navigationController, animated: true, completion: nil)
    }
}
