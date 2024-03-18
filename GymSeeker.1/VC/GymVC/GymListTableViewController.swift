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

class GymListTableViewController: UITableViewController, UISearchBarDelegate {
    var token: String?
    var user: User?
    var gym: Gym?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredGym: [Gym] = []
    
    var GymList: [Gym] = [
//        Gym(name: "Flare", location: "Jabriya", workingHours: "8:00AM - 12:00AM", price: "10KD", image: "Flare", gender: "Female"),
//        Gym(name: "Spark", location: "Kuwait City", workingHours: "7:00AM - 12:00AM", price: "10KD", image:"Spark", gender: "Female"),
//        Gym(name: "Peak", location: "Shuwaikh", workingHours: "6:00AM - 12:00AM", price: "10KD",image: "Peak", gender: "Female"),
//        
//        Gym(name: "Spark", location: "Sharq", workingHours: "7:00AM - 12:00AM", price: "10KD", image:"Spark", gender: "Male"),
//        Gym(name: "Oxygen", location: "Kuwait City", workingHours: "7:00AM - 12:00AM", price: "10KD", image:"Oxy", gender: "Male")
    ]
    
    let segmentedControl: UISegmentedControl = {
        let items = ["Female", "Male"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        navigationItem.largeTitleDisplayMode = .never
        tableView.register(GymTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        setupSearchBar()
        setupConstraints()
        
        filteredGym = GymList
//        if let savedToken = UserDefaults.standard.string(forKey: "AuthToken") {
//            token = savedToken
//        }
        getAllGym()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGym.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    // MARK: Navigation to DetailsView for the gym
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsVC = DetailScreenViewController() //change details
        let selectedGym = filteredGym[indexPath.row]
        
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        segmentedControl.backgroundColor =  #colorLiteral(red: 0.9997681975, green: 0.7527479529, blue: 0.6315632463, alpha: 1)
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search gym here"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // Filter gyms by Female gender
            filteredGym = GymList.filter { $0.gender.lowercased() == "female" }
        case 1:
            // Filter gyms by Male gender
            filteredGym = GymList.filter { $0.gender.lowercased() == "male" }
        default:
            // If no segment selected, show all gyms
            filteredGym = GymList
        }
        tableView.reloadData()
    }
    
    
    func getAllGym() {
        
        NetworkManager.shared.fetchAllGym(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "") { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let gym):
                    print(gym)
                    self.GymList = gym
                case .failure:
                    print("Something went wrong in fetching gym")
                }
            }
        }
        
    }
}

extension GymListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredGym = GymList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredGym = GymList
        }
        tableView.reloadData()
    }
}
