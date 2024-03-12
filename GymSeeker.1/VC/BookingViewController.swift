//
//  BookingViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 11/03/2024.
//

import UIKit

class BookingViewController: UITableViewController {

    var Booking: [BookingDetails] = [BookingDetails(date: "1-1-2024", name: "Fatma", price: "10KD"),
                                     BookingDetails(date: "1-1-2024", name: "Fatma", price: "10KD"),
                                     BookingDetails(date: "1-1-2024", name: "Fatma", price: "10KD")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
