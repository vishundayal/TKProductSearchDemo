//
//  ProductFilterTableViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit
import MARKRangeSlider

class ProductFilterTableViewController: UITableViewController {

    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var priceRangeSlider: MARKRangeSlider!
    @IBOutlet weak var wholeSaleSwitch: UISwitch!
    var productFilter: ProductFilter!
    weak var shopTypeViewController: ShopTypeCollectionViewController?
    
//    MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refreshData()
    }
    
    func setupUI() {
        self.priceRangeSlider.minimumDistance = 0.05
        self.getReferenceOfShopTypeCollectionViewController()
     }
    
    func refreshData() {
        self.setPriceLabelValues()
        self.shopTypeViewController?.prepareShopTypesList(selectedShopTypeKeys: self.productFilter.shopTypes)
        self.shopTypeViewController?.collectionView?.reloadData()
        self.wholeSaleSwitch.isOn = self.productFilter.isWholeSale
    }
    
    func setPriceLabelValues() {
        self.minPriceLabel.text = self.productFilter.minPriceStringValue()
        self.maxPriceLabel.text = self.productFilter.maxPriceStringValue()
        self.priceRangeSlider.setThumbPositions(leftPrice: self.productFilter.minPrice, rightPrice: self.productFilter.maxPrice)
    }
    
    func showShopTypesList() {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "SelectShopTypeNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! SelectShopTypeViewController
        viewController.selectedShopTypes = self.productFilter.shopTypes
        viewController.applyButtonHandler = { (shopTypes: [String])->Void in
            self.productFilter.shopTypes = shopTypes
            self.refreshData()
        }
        self.parent?.present(navigationController, animated: true, completion: nil)
    }
    
    func getReferenceOfShopTypeCollectionViewController() {
        for item in self.childViewControllers {
            if item is ShopTypeCollectionViewController {
                self.shopTypeViewController = item as? ShopTypeCollectionViewController
                self.shopTypeViewController?.shopTypeRemoveHandler = { (tag:String)->Void in
                    let index = self.productFilter.shopTypes.index(of: tag)
                    if index != nil {
                        self.productFilter.shopTypes.remove(at: index!)
                    }
                }
            }
        }
    }
    
//    MARK:- Actions
    @IBAction func wholeSaleValueChanged(_ sender: UISwitch) {
        self.productFilter.isWholeSale = sender.isOn
    }
    
    @IBAction func priceRangeSliderValueChanged(_ sender: Any) {
        self.productFilter.minPrice = self.priceRangeSlider.minimumPrice()
        self.productFilter.maxPrice = self.priceRangeSlider.maximumPrice()
        self.setPriceLabelValues()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.showShopTypesList()
        }
    }
}
