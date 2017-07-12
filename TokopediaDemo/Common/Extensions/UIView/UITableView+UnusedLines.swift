//
//  UITableView+UnusedLines.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

extension UITableView {

    func removeUnusedBottomLines() {
        self.tableFooterView = UIView()
    }
}
