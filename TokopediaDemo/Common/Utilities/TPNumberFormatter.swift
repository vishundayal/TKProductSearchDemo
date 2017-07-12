//
//  TPNumberFormatter.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import Foundation

class TPNumberFormatter {
    
    func currencyFormatter(fractionLength: Int) -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = fractionLength
        numberFormatter.locale = Locale(identifier: "id")
        return numberFormatter
    }
}
