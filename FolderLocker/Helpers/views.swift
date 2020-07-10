//
//  views.swift
//  FolderLocker
//
//  Created by Bhargava on 08/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

@IBDesignable
open class customView : UIView{
    @IBInspectable var BackGroundColor : UIColor?{
        didSet{
            self.layer.backgroundColor = BackGroundColor?.cgColor
        }
    }
    @IBInspectable var CornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var borderwidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderwidth
        }
    }
    
}
