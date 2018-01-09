//
//  YADLSettingsViewController.swift
//  YADL Reference App
//
//  Created by Christina Tsangouri on 11/6/17.
//  Copyright © 2017 Christina Tsangouri. All rights reserved.
//

import Foundation
import UIKit

class YADLSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet
    var tableView: UITableView!
    var store: RSStore!
    var items: [String] = ["Take the Full Assessment", "Take the Spot Assessment", "Set Notification Time", "Email Full Assessment Results", "Email Spot Assessment Results", "Sign out"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.store = RSStore()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let notificationHour = self.store.valueInState(forKey: "notificationHour") as! String
        let notificationMinutes = self.store.valueInState(forKey: "notificationMinutes") as! String
        
        var convertedTime:[String]! = []
        
        convertedTime = self.hourConversion(hour: notificationHour,minute: notificationMinutes)
        
        let notificationString = self.items[2] + ":      " + convertedTime[0] + ":" + convertedTime[2] + " " + convertedTime[1]
        
        if(indexPath.row == 2) {
            cell.textLabel?.text = notificationString
        }
        else {
            
            cell.textLabel?.text = self.items[indexPath.row]
        }
        
        cell.textLabel?.textColor = UIColor.init(colorLiteralRed: 0.44, green: 0.66, blue: 0.86, alpha: 1.0)
        

        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60.0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var deselectedCell = tableView.cellForRow(at: indexPath)!
        deselectedCell.backgroundColor = UIColor.clear
        
       
    }
    
    
    func hourConversion (hour: String, minute: String) -> [String] {
        
        var newHour: String!
        var newMinute: String!
        var am_pm: String!
        
        var minuteInt: Int = Int(minute)!
        if minuteInt < 10 {
            newMinute = "0" + minute
        }
        else {
            newMinute = minute
        }
        
        switch hour{
        case "00":
            newHour = "12"
            am_pm = "am"
        case "12":
            newHour = "12"
            am_pm = "pm"
        case "13":
            newHour = "1"
            am_pm = "pm"
        case "14":
            newHour = "2"
            am_pm = "pm"
        case "15":
            newHour = "3"
            am_pm = "pm"
        case "16":
            newHour = "4"
            am_pm = "pm"
        case "17":
            newHour = "5"
            am_pm = "pm"
        case "18":
            newHour = "6"
            am_pm = "pm"
        case "19":
            newHour = "7"
            am_pm = "pm"
        case "20":
            newHour = "8"
            am_pm = "pm"
        case "21":
            newHour = "9"
            am_pm = "pm"
        case "22":
            newHour = "10"
            am_pm = "pm"
        case "23":
            newHour = "11"
            am_pm = "pm"
        default:
            newHour = hour
            am_pm = "am"
        }
        
        
        return [newHour,am_pm,newMinute]
        
    }
    
    
    
    



}
