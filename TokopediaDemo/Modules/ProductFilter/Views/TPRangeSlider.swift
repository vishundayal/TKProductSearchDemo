//
//  TPRangeSlider.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 13/07/17.
//  Copyright © 2017 Tokopedia. All rights reserved.
//

import UIKit
import MARKRangeSlider

extension MARKRangeSlider {

    
//    MARK:- Services
    func minimumPrice()->Int {
        return MIN_Price + Int(CGFloat(MAX_Price-MIN_Price) * self.leftValue)
    }
    func maximumPrice()->Int {
        return MIN_Price + Int(CGFloat(MAX_Price-MIN_Price) * self.rightValue)
    }

}
