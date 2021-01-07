//
//  CallingFrameworkFunction.swift
//  SimpleSwiftFramework
//
//  Created by Nantarat Buranajinda on 7/1/2564 BE.
//

import Foundation
import UIKit

public class CallingFrameworkFunction {
    public class func alert(message: String?) {
        let alert = UIAlertController(
            title: "Alert from Framework",
            message: "Your message is \"\(message ?? "")\"",
            preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alert, animated: true, completion: nil)
        }
    }
}
