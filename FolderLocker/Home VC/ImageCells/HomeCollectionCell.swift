//
//  HomeCollectionCell.swift
//  FolderLocker
//
//  Created by Bhargava on 13/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageviews : UIImageView!
    override func awakeFromNib() {
        imageviews.layer.cornerRadius = 7.5
        imageviews.layer.borderWidth = 1
        imageviews.layer.borderColor = UIColor.black.cgColor
    }
}
