//
//  ShopTypeCollectionViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShopTypeCollectionViewCell"

class ShopTypeCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var shopTypes: [ShopType] = []
    var shopTypeRemoveHandler: ((_ tag:String)->Void)?

//    MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shopTypes = ShopTypeDataManager().loadData()
    }
//MARK:- Public
    func prepareShopTypesList(selectedShopTypeKeys:[String]) {
        self.shopTypes.removeAll()
        let allTypes = ShopTypeDataManager().loadData()
        for item in allTypes {
            if selectedShopTypeKeys.contains(item.shopTypeKey) {
                self.shopTypes.append(item)
            }
        }
        self.collectionView?.reloadData()
    }
//    MARK:- Private
    func cellSizeForText(text:String) -> CGSize {
        let font = UIFont.systemFont(ofSize: 14)
        let stringAttributes = [NSFontAttributeName: font]
        var size = text.size(attributes: stringAttributes)
        size.width = ceil(size.width)
        size.height = ceil(size.height)
        let padding: CGFloat = 20
        let buttonHeight: CGFloat = 50
        size.width += padding
        size.width += buttonHeight
        size.height = buttonHeight
        return size
    }
//    MARK:- Action
    func removeButtonTapped(sender:UIButton) {
        let type = self.shopTypes[sender.tag]
        if self.shopTypeRemoveHandler != nil {
            self.shopTypeRemoveHandler!(type.shopTypeKey)
        }
        self.shopTypes.remove(at: sender.tag)
        self.collectionView?.reloadData()
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shopTypes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShopTypeCollectionViewCell
        cell.removeButton.tag = indexPath.item
        cell.removeButton.addTarget(self, action: #selector(ShopTypeCollectionViewController.removeButtonTapped), for: .touchUpInside)
        let type = self.shopTypes[indexPath.item]
        cell.textLabel.text = type.displayText
        return cell
    }
//    MARK:- UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let type = self.shopTypes[indexPath.item]
        return self.cellSizeForText(text: type.displayText)
    }
}
