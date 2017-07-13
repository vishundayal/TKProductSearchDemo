//
//  ProductListCollectionViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Tokopedia. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProductCollectionViewCell"

class ProductListCollectionViewController: UICollectionViewController {

    var productList:[Product] = []
    
//    MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        let product = self.productList[indexPath.item]
        cell.configureProduct(product: product)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row > self.productList.count - 5 {
            (self.parent as! ProductsListViewController).loadNexPage()
        }
    }
}
