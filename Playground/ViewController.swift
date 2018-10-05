//
//  ViewController.swift
//  Playground
//
//  Created by Patrick Marshall on 05/10/18.
//  Copyright © 2018 Patrick Marshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondButton.backgroundColor = UIColor.red
    }

    @IBAction func secondButtonPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

