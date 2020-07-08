//
//  buttons.swift
//  FolderLocker
//
//  Created by Bhargava on 07/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
@IBDesignable
open class customButton : UIButton{
    @IBInspectable var backGroundColor : UIColor?{
        didSet{
            self.layer.backgroundColor = backGroundColor?.cgColor
        }
    }
    @IBInspectable var cornerRadius : CGFloat = 0{
           didSet{
               self.layer.cornerRadius = cornerRadius
           }
       }
    @IBInspectable var borderWIdth : CGFloat = 0{
              didSet{
                self.layer.borderWidth = borderWIdth
              }
          }
    @IBInspectable var borderColor : UIColor?{
          didSet{
            self.layer.borderColor = borderColor?.cgColor
          }
      }
}

