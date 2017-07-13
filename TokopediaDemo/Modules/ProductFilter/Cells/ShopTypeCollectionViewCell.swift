//
//  ShopTypeCollectionViewCell.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Tokopedia. All rights reserved.
//

import UIKit

class ShopTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    func setupUI() {
        self.borderView.layer.borderColor = UIColor.colorWithHexValue(0xB4B4B4).cgColor
        self.borderView.layer.borderWidth = 1.0
        self.borderView.roundedCorner()
        self.removeButton.imageView?.contentMode = .scaleAspectFit
    }
}
