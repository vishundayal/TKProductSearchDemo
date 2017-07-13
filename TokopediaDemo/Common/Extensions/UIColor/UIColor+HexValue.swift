//
//  UIColor+HexValue.swift
//  Vault-i
//
//  Created by Vishun on 11/01/16.
//  Copyright © 2016 Vishun. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithHexValue(_ netHex:Int) -> UIColor {
        let r = (netHex >> 16)&0xff
        let g = (netHex >> 8)&0xff
        let b = netHex & 0xff
        return UIColor(red:CGFloat(r)/255, green:CGFloat(g)/255, blue:CGFloat(b)/255, alpha: 1.0)
    }
}
