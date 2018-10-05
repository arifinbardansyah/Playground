//
//  ThirdViewController.swift
//  Playground
//
//  Created by Patrick Marshall on 05/10/18.
//  Copyright © 2018 Patrick Marshall. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var image: UIImage = UIImage()
    var cityName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        firstImageView.image = image
        label.text = cityName
    }
}
