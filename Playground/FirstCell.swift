//
//  FirstCell.swift
//  Playground
//
//  Created by Patrick Marshall on 05/10/18.
//  Copyright © 2018 Patrick Marshall. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var closure: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func closureButton(_ sender: Any) {
//        closure
    }
}
