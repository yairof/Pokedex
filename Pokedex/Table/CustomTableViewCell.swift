//
//  CustomTableViewCell.swift
//  Pokedex
//
//  Created by Yairo Fernandez on 10/25/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
