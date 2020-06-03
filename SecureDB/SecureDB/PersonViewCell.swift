//
//  PersonViewCell.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 02/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import UIKit

class PersonViewCell: UITableViewCell {

    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
