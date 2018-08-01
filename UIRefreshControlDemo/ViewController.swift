//
//  ViewController.swift
//  UIRefreshControlDemo
//
//  Created by Raghavendra Dattawad on 8/1/18.
//  Copyright © 2018 Raghavendra Dattawad. All rights reserved.
//

import UIKit



struct Hotels  {
    let name:String
    let place:String
}


class ViewController: UIViewController,UITableViewDataSource{
   lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
  var  hotelsArray = [Hotels(name: "Donne", place: "jayanagar"),Hotels(name: "star", place: "koramangala")]
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   

        
   self.tableview.addSubview(refreshControl)
        
    
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = hotelsArray[indexPath.row].name
        cell.detailTextLabel?.text = hotelsArray[indexPath.row].place
        
        
        return cell
        
    }

    
    @objc func  handleRefresh(_ refreshControl:UIRefreshControl){
        
    let newHotel = Hotels(name: "LV", place: "vijayanagar")
        hotelsArray.append(newHotel)
        
        hotelsArray.sort() { $0.name < $1.place }
        
        self.tableview.reloadData()
        refreshControl.endRefreshing()
        
        
        
    }
}

