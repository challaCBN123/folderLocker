//
//  listCell.swift
//  FolderLocker
//
//  Created by Bhargava on 09/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class listCell: UITableViewCell {
    @IBOutlet weak var viewStyle: UIView!
    
    @IBOutlet weak var menuListLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
