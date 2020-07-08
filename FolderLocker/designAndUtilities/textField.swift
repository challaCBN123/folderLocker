//
//  textField.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
// MARK:- Custom Textfields.
    @IBDesignable
    open class customUITextField: UITextField {
        func setup() {
            let paddingView = UIView(frame: CGRect(x: 5, y: 0, width: 10, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = .always
            
            /*let border = CALayer()
            let width = CGFloat(2.0)
        border.borderColor = UIColor.blue.cgColor
            border.frame = CGRect(x: 0, y: self.bounds.height - width, width:self.frame.size.width,height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)*/
        self.layer.masksToBounds = true
            //self.backgroundColor = UIColor.init(white: 0.5, alpha: 0.2)
    }
        @IBInspectable var bcColor : UIColor? {
                   didSet{
                    self.backgroundColor = bcColor
                   }
               }
        
        @IBInspectable var cornerRadius : CGFloat = 0 {
            didSet{
                self.layer.cornerRadius = cornerRadius
            }
        }
 @IBInspectable var placeHolderColor: UIColor? {
              get {
                  return self.placeHolderColor
              }
              set {
                  self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
              }
          }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
        
       
}
