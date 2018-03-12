//
//  YearAndMajorTableViewController.swift
//  Beta_Scholarship
//
//  Created by James Weber on 2/24/18.
//  Copyright © 2018 James Weber. All rights reserved.
//

import UIKit
import DeviceKit

class LeadershipViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var bottomLabel: UILabel!

    struct HousePositionSections {
        var sectionName : String!
        var sectionPositions : [String]!
    }

    var userHousePositions:[String] = [String]()

    var housePosArr = [HousePositionSections]()

    func setHousePositionSections() {
        housePosArr = [
            HousePositionSections(sectionName: "Misc. House Positions",
                    sectionPositions: ["President",
                                       "Chapter Counselor",
                                       "IFC Representative",
                                       "Technology Chair",
                                       "Wellness Chair",
                                       "Wellness Committee",
                                       "BMOC Chair",
                                       "BMOC Member"]),

            HousePositionSections(sectionName: "Programming",
                    sectionPositions: ["VP of Programming",
                                       "Programming Committee Member",
                                       "Social Chair",
                                       "Social Committee Member",
                                       "Philanthropy Chair",
                                       "Community Service Chair",
                                       "Intramural Chair"]),

            HousePositionSections(sectionName: "Brotherhood",
                    sectionPositions: ["VP of Brotherhood",
                                       "Brotherhood Chair",
                                       "Brotherhood Committee Member",
                                       "Kai Chair",
                                       "Kai Committee",
                                       "Scholarship Chair",
                                       "Scholarship Committee Member",
                                       "Ritual Chair"]),

            HousePositionSections(sectionName: "Education",
                    sectionPositions: ["VP of Education",
                                       "Education Chair",
                                       "Education Committee Member",
                                       "Active Member Education"]),

            HousePositionSections(sectionName: "Recruitment",
                    sectionPositions: ["VP of Recruitment",
                                       "Recruitment Committee Member"]),

            HousePositionSections(sectionName: "Risk Management",
                    sectionPositions: ["VP of Risk",
                                       "Risk Committee Member",
                                       "House Manager"]),

            HousePositionSections(sectionName: "Finance",
                    sectionPositions: ["VP of Finance",
                                       "Kitchen Manager"]),

            HousePositionSections(sectionName: "Communication",
                    sectionPositions: ["VP of Communication",
                                       "Social Media Chair"])
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
        configureButton(button: backButton, view: self)
        configureButton(button: nextButton, view: self)
        setHousePositionSections() 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return housePosArr.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return housePosArr[section].sectionPositions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HousePositions", for: indexPath)
        cell.textLabel?.text = housePosArr[indexPath.section].sectionPositions[indexPath.row]
        cell.backgroundColor = UIColor.white
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return housePosArr[section].sectionName
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            //year = (cell.textLabel?.text)!
            //print(year)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    func changeTextForSmallDevices() {
        let modelName = Device()
        print("model: " + String(modelName.description))
        if (modelName.description == "iPhone 5s" || modelName.description == "iPhone SE" || modelName.description == "Simulator (iPhone 5s)") {
            bottomLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            bottomLabel.sizeToFit()
        }
    }
    
    @IBAction func unwindToLeadership(segue:UIStoryboardSegue) {
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /* 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}