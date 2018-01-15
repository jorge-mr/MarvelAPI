//
//  SuperTableViewCell.swift
//  MarvelAPI
//
//  Created by Jorge MR on 13/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit

class SuperTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
