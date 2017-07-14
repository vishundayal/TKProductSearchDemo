//
//  ProductCollectionViewCell.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func prepareForReuse() {
        self.imageView.sd_cancelCurrentImageLoad()
    }
    func configureProduct(product:Product) {
        if product.image_uri != nil {
            let imageUrl = URL(string: product.image_uri!)
            self.imageView.sd_setImage(with: imageUrl)
        }
        self.nameLabel.text = product.name
        self.priceLabel.text = product.price
    }
}
