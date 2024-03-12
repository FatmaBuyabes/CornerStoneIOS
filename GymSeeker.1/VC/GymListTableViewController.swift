//
//  GymListTableViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import UIKit
import SnapKit
import Kingfisher

class GymListTableViewController: UITableViewController {
    
    var GymList: [Gym] =
    [Gym(gymName: "Flare", location: "Shuwaikh", workingHours: "1-6", price: "10KD"),
     Gym(gymName: "Flare", location: "Shuwaikh", workingHours: "1-6", price: "10KD"),
     Gym(gymName: "Flare", location: "Shuwaikh", workingHours: "1-6", price: "10KD")]
    
    override func viewDidLoad() {
        func viewDidLoad() {
            super.viewDidLoad()
            //register the cell
            //self.tableView.register(GymTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.register(GymTableViewCell.self, forCellReuseIdentifier: "GymCell")

        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GymList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GymCell", for: indexPath) as! GymTableViewCell
        let gym = GymList[indexPath.row]
        
        cell.gymNameLabel.text = gym.gymName
        cell.gymLocationLabel.text = gym.location
        cell.gymWorkingHoursLabel.text = gym.workingHours
        //image is empty
        
        // Configure the cell with data
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let studentVC = ()
//        let selectedStudent = studentAccount[indexPath.row]
//        
//        studentVC.studentAccount = selectedStudent
//        
//        navigationController?.pushViewController(studentVC, animated: true)
//    }

        
    }

