//
//  touchViewToHideKBD.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
extension UIViewController{
    func hideKeyBoardOnTap(){
           let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpVC.backgroundTap))
                       self.view.addGestureRecognizer(tapGestureRecognizer)
       }
    @objc func backgroundTap(_ sender: UITapGestureRecognizer) {
        // go through all of the textfield inside the view, and end editing thus resigning first responder
        // ie. it will trigger a keyboardWillHide notification
        self.view.endEditing(true)
    }
    
}
