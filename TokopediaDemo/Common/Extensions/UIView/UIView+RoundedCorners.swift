//
//  UIView+RoundedCorners.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundedCorner() {
        self.layer.cornerRadius = self.bounds.size.height / 2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    func roundedCorner(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

}
