//
//  alerts.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
// MARK:- Alerts.
extension UIViewController {
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
    }))
    self.present(alertController, animated: true, completion: nil)
  }
}
