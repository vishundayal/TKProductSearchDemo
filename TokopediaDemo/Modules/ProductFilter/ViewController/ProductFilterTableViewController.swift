//
//  ProductFilterTableViewController.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Tokopedia. All rights reserved.
//

import UIKit
import MARKRangeSlider

class ProductFilterTableViewController: UITableViewController {

    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var priceRangeSlider: MARKRangeSlider!
    
    weak var productFilter: ProductFilter!

    
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
    }
    func refreshData() {
        self.setPriceLabelValues()
    }
    
    func setPriceLabelValues() {
        self.minPriceLabel.text = self.productFilter.minPriceStringValue()
        self.maxPriceLabel.text = self.productFilter.maxPriceStringValue()
    }
    
    func showShopTypesList() {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "SelectShopTypeNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! SelectShopTypeViewController
        viewController.selectedShopTypes.append(contentsOf: self.productFilter.shopTypes)
        self.parent?.present(navigationController, animated: true, completion: nil)
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
