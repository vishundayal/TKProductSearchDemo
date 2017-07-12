//
//  ProductCollectionViewCell.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Tokopedia. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configureProduct(product:Product) {
        self.imageView.image = UIImage(named: product.image_uri!)
        self.nameLabel.text = product.name
        self.priceLabel.text = product.price
    }
}
