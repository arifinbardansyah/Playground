//
//  SecondViewController.swift
//  Playground
//
//  Created by Patrick Marshall on 05/10/18.
//  Copyright © 2018 Patrick Marshall. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var provinceList: [DAOProvinceProvinces] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        fetchData()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50.0
        
        tableView.register(UINib(nibName: "FirstCell", bundle: nil), forCellReuseIdentifier: "firstCell")
    }
    
    func fetchData() {
        var url: URLRequest?
        url = URLRequest(url: URL(string: "http://www.jihadaamalia.com:8080/provinces")!)
        url?.httpMethod = HTTPMethod.get.rawValue
        
       url?.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJyczl0diIsImRhdGEiOiJ7XCJ1c2VybmFtZV9pZFwiOjQ5LFwidXNlcl9pZFwiOjQ5LFwicGV0X2lkXCI6MTEyfSIsImlhdCI6MTUzMTExNDk0MywiYXVkIjoiVEVTVCJ9.sYdHd-1BlZYd52Qeh2DGWm8aI6YwVUPuRmR9iTeIgH0", forHTTPHeaderField: "token")
        url?.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        
        Alamofire.request(url!).responseJSON { response in
            let mappedData = DAOProvinceBaseClass(json: JSON(response.result.value))
            guard let data = mappedData.response?.provinces else { return }
            self.provinceList = data
            
            self.tableView.reloadData()
        }
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.provinceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell") as! FirstCell
        let url = URL(string: "https://i2.wp.com/beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg?resize=640,426")
        
        cell.selectionStyle = .none
        
        cell.firstImageView.contentMode = .scaleAspectFit
        cell.firstImageView.clipsToBounds = true
        cell.firstImageView.layer.borderWidth = 1
        cell.firstImageView.layer.borderColor = UIColor.darkGray.cgColor
        
        cell.firstImageView.sd_setImage(with: url) { (image, error, cache, url) in
            
        }
        
        cell.label.text = self.provinceList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FirstCell
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "thirdVC") as! ThirdViewController
        
        vc.cityName = cell.label.text!
        vc.image = cell.firstImageView.image!
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
