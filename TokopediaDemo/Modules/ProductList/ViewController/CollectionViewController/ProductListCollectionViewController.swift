//
//  ProductListCollectionViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProductCollectionViewCell"

class ProductListCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var productList:[Product] = []
    
//    MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
//    MARK:- UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.size.width
        var cellWidth = floor(width/2)
        if cellWidth*2 > width-1 {
            cellWidth -= 1
        }
        return CGSize(width: cellWidth, height: 260)
    }
}
