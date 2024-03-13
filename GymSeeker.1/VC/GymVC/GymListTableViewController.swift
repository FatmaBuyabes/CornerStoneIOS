//
//  GymListTableViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import SnapKit
import Alamofire
import Eureka
import UIKit
import Kingfisher

class GymListTableViewController: UITableViewController, UISearchBarDelegate{
    var token: String?
    var user: User?
    var gym: Gym?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredGym: [Gym] = []
    
    var GymList: [Gym] =
        [Gym(gymName: "Flare ", location: "Jabriya", workingHours: "8:00AM - 12:00AM", price: "10KD"),
         Gym(gymName: "Peak", location: "Shuwaikh", workingHours: "6:00AM - 12:00AM", price: "10KD"),
         Gym(gymName: "Spark", location: "Sharq", workingHours: "7:00AM - 12:00AM", price: "10KD")]
    
    let segmentedControl: UISegmentedControl = {
            let items = ["Female","Male"]
            let segmentedControl = UISegmentedControl(items: items)
            segmentedControl.selectedSegmentIndex = 0
            return segmentedControl
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(tableView)
//        let TabBarVC = TabBarViewController()
//        TabBarVC.token = token // You can also pass the token to other view controllers if needed
//        self.navigationController?.pushViewController(TabBarVC, animated: true)
        //title = "GYM SEEKER"
        tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        navigationItem.largeTitleDisplayMode = .never
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GymCell")
        tableView.register(GymTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        setupConstraints()
        setupSearchBar()
        
        
    }
    
    
        // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredGym.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }

    //MARK: Navigation to DetailsView for the gym
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsVC = DetailScreenViewController() //change details
        let selectedGym = GymList[indexPath.row]
        
        DetailsVC.gym = selectedGym
        navigationController?.pushViewController(DetailsVC, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GymTableViewCell
                let gym = filteredGym[indexPath.row]
                cell.configure(with: gym)
                return cell
    }
    
    func setupConstraints() {
        
        segmentedControl.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top) // Adjusted constraint to start from the top of the safe area
                make.leading.trailing.equalToSuperview()
                make.width.equalToSuperview()
            }
        segmentedControl.backgroundColor = .orange
            
       
        }
    
    private func setupSearchBar() {
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search gym here"
            navigationItem.searchController = searchController
            definesPresentationContext = true
        }

    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        }
    }

extension GymListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredGym = GymList.filter { $0.gymName.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredGym = GymList
        }
        tableView.reloadData()
    }
    
    
}
