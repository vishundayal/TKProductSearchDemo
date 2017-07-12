//
//  UIViewController+Alerts.swift
//  TokopediaDemo
//
//  Created by Vishun Dayal on 12/07/17.
//  Copyright © 2017 Vishun. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title:String?, message:String?) {
        var newTitle = title
        if newTitle == nil {
            newTitle = "Vault-i"
        }
        let okButtonTitle = NSLocalizedString("Ok", comment: "Ok")
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: newTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertView(title: newTitle, message: message, delegate: nil, cancelButtonTitle: okButtonTitle)
            alert.show()
        }
    }

}
