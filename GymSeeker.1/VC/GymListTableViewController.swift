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
    
    let locationLabel = UILabel()
    let gymName = UILabel()
    let gymImageView = UIImageView()
    
    
    
    var GymList: [Gym] =
        [Gym(gymName: "Flare", location: "Shuwaikh", workingHours: "1-6", price: "10KD"),
         Gym(gymName: "Flare", location: "Shuwaikh", workingHours: "1-6", price: "10KD"),
         Gym(gymName: "Flare", location: "Shuwaikh", workingHours: "1-6", price: "10KD")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    private func setupViews() {
        gymName.font = .systemFont(ofSize: 16, weight: .medium)
        gymName.textColor = .black  // Customize as needed

        locationLabel.font = .systemFont(ofSize: 14, weight: .regular)
        locationLabel.textColor = .darkGray  // Customize as needed
        gymImageView.contentMode = .scaleAspectFit

        view.addSubview(locationLabel)
        view.addSubview(gymName)
        view.addSubview(gymImageView)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints() {
        gymImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)  // 16 points from the leading edge of the cell
            make.centerY.equalToSuperview()  // Vertically centered
            make.width.height.equalTo(40)  // 40x40 points
        }

        gymName.snp.makeConstraints { make in
            make.leading.equalTo(gymImageView.snp.trailing).offset(16)  // 16 points from the trailing edge of the image view
            make.top.equalToSuperview().offset(16)  // 16 points from the top edge of the cell
            make.trailing.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the trailing edge of the cell
        }

        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(gymName.snp.leading)  // Aligned with the leading edge of the account number label
            make.top.equalTo(gymName.snp.bottom).offset(8)  // 8 points below the account number label
            make.trailing.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the trailing edge of the cell
            make.bottom.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the bottom edge of the cell
        }
    }
    
    
        // MARK: - Table view data source
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 100
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return GymList.count
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let gym = GymList[indexPath.row]
//        
//        cell.textLabel?.text = "\(gym.name)"
//        
//        cell.textLabel?.text = "\(gym.location)"
//                cell.textLabel?.text = gym.workingHours
//        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    //MARK: Navigation to DetailsView for the gym
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsVC = MainViewController() //change
        //let selectedGym = GymList[indexPath.row]
        
        //DetailsVC.gym = selectedGym
        
        navigationController?.pushViewController(DetailsVC, animated: true)
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
